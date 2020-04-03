import UIKit

@available(iOS 13.0, *)
struct FeaturedAppSection: Section {

    var presenter = ListPresenter()
    
    let numberOfItems = ListPresenter().listsVCObjectsCount()

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ExtraLargeAppCell.self), for: indexPath) as? ExtraLargeAppCell else { return UICollectionViewCell() }

        cell.listViewState(at: indexPath.item)
        return cell
    }
}
