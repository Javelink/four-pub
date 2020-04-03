import UIKit

@available(iOS 13.0, *)
final class GamesViewController: UIViewController {
    lazy var sections: [Section] = [
        FeaturedAppSection(),
        SectionTitleSection(),
        SmallAppSection()
    ]

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: String(describing: SmallAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SmallAppCell.self))
        collectionView.register(UINib(nibName: String(describing: ExtraLargeAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ExtraLargeAppCell.self))
        collectionView.register(UINib(nibName: String(describing: SectionTitleCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SectionTitleCell.self))

        return collectionView
    }()

    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }
}

@available(iOS 13.0, *)
extension GamesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

@available(iOS 13.0, *)
extension GamesViewController: UICollectionViewDelegate {}
