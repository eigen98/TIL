
import UIKit
import SwiftUI


class HomeViewController : UICollectionViewController{
    //준비한 컨텐츠를 담을 배열
    var contents : [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 설정
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //스와이프 액션이 일어났을때 가리는 효과
        navigationController?.hidesBarsOnSwipe = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "netflix_icon"), style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        
        //Data 설정, 가져오기
        contents = getContents()
        
        //컬렉션 뷰 아이템 셀 설정
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "ContentCollectionViewCell")
        collectionView.register(ContentCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ContentCollectionViewHeader")
        
        collectionView.register(ContentCollectionViewRankCell.self, forCellWithReuseIdentifier: "ContentCollectionViewRankCell")
        collectionView.collectionViewLayout = layout()
        
    }
    //컨텐츠 배열 반환하는 함수
    func getContents() -> [Content]{
        //Bundle = 컨텐츠 Plist의 경로를 알려줌.
        guard let path = Bundle.main.path(forResource: "Content", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let list = try? PropertyListDecoder().decode([Content].self, from: data) else {
                  return []
                  print("배열 반환 실패")
              }
        return list
    }
    
    
    //각각의 섹션 타입에 대한UICollectionViewLayout 생성
    private func layout() -> UICollectionViewLayout{
        return UICollectionViewCompositionalLayout {[weak self] sectionNumber,
            environment -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            switch self.contents[sectionNumber].sectionType {
            case .basic :
                return self.createBasicTypeSection()
                
            case .large :
                return self.createLargeTypeSection()
            case .rank :
                return self.createRankTypeSection()
            
            default :
                return nil
            }
        }
    }
    //섹션 별로 다른 레이아웃을 줄것이기에 클로져로 설정
    //컴포지셔널 레이아웃 설정하기 위해 함수 생성 (베이직)
    private func createBasicTypeSection() -> NSCollectionLayoutSection{
      //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.75))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 10, leading: 5, bottom: 0, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        return section
        //섹션 헤더
        let sectionHeader = self.createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
    }
    
    //순위 표시 Section Layout 설정
    private func createRankTypeSection() -> NSCollectionLayoutSection{
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        item.contentInsets = .init(top: 10, leading: 5, bottom: 0, trailing: 5)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let sectionHeader = self.createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        return section
        
    }
    
    //섹션 헤더 레이아웃 설정
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem{
        //섹션 헤더 사이즈
        let layoutCollectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
        
        //섹션 헤더 레이아웃
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutCollectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        return sectionHeader
    }
    
    private func createLargeTypeSection() -> NSCollectionLayoutSection{
      
        //item
          let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.75))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          item.contentInsets = .init(top: 10, leading: 5, bottom: 0, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(400))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        return section
    }
}
//데이터 소스 설정. 테이블뷰처럼 각 섹션이 어떤 셀을 가질지, 섹션당 셀의 개수는 어떻게 가질지 등을 정해주고 알려줌.
//UICollectionView DataSource, Delegate
extension HomeViewController {
    //섹션당 보여질 셀의 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if contents[section].sectionType == .basic
            || contents[section].sectionType == .large
            || contents[section].sectionType == .rank
        {
            
        
        switch section {
        case 0 :
            return 1
        default :
            return contents[section].contentItem.count
        }
        }
        return 0
    }
    //셀 설정
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch contents[indexPath.section].sectionType{
        case .basic, .large :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else {return UICollectionViewCell()}
            
            cell.imageView.image = contents[indexPath.section].contentItem[indexPath.row].image
            return cell
        case .rank :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewRankCell", for: indexPath) as? ContentCollectionViewRankCell else { return UICollectionViewCell() }
            
            cell.imageView.image = contents[indexPath.section].contentItem[indexPath.row].image
            cell.rankLabel.text = String(describing: indexPath.row + 1)
            return cell
            
        default :
            return UICollectionViewCell()
        }
    }
    //헤더 뷰 설정
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContentCollectionViewHeader", for: indexPath) as? ContentCollectionViewHeader else {fatalError("Could not dequque Header") }
            
            headerView.sectionNameLabel.text = contents[indexPath.section].sectionName
            return headerView
        }else {
            return UICollectionReusableView()
        }
    }
    
    //전체 섹션 개수 설정
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    //나중에 액션을 강제할 딜리게이트 필요
    //셀 선택
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = contents[indexPath.section].sectionName
        print("TEST : /(sectionName)섹션의 /(indexPath.row + 1)번째 컨텐츠")
    }
    
}

//SwiftUI를 활용한 미리보기
struct HomeViewController_Previews : PreviewProvider {
    static var previews: some View{
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container : UIViewControllerRepresentable{
        
     func makeUIViewController(context : Context) ->
        UIViewController{
            let layout = UICollectionViewLayout()
            let homeViewController =
            HomeViewController(collectionViewLayout: layout)
            return UINavigationController(rootViewController: homeViewController)
         
     }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
        
        typealias UIViewControllerType = UIViewController
        
    }
}
