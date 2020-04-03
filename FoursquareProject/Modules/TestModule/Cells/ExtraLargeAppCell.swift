import UIKit

final class ExtraLargeAppCell: UICollectionViewCell {
    @IBOutlet private var captionLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var thumbnailView: UIView!
    @IBOutlet weak var imaheView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.layer.cornerRadius = 8
    }

    func listViewState(at index: Int) {
        captionLabel.text = ListViewEnum.listsVCObjects[index].title
        subtitleLabel.text = ListViewEnum.listsVCObjects[index].description
        imaheView.image = ListViewEnum.listsVCObjects[index].image
    }
}
