# FilterMovieDemo
教你写电影筛选页View

1.顶部间距固定，cell大小随文字长度改变。
2.headerView是collectionView的subView，设置```contentInsect```

```
//你的header高度由你定
CGFloat height = self.headArray.count * 40 + 25;
UIEdgeInsets contentInset = self.collectionView.contentInset;
//设置collectionView的上边距是从headerView的底部开始
contentInset.top= height ;
self.collectionView.contentInset = contentInset;

//注意：headerView的frame设置y应为-height
_headerView = [[ZFilterHeaderView alloc]initWithFrame:CGRectMake(0, -height, self.view.width, height)];
```

简单来说，我的collectionView结构为:**headerView是一个横向collectionView集合**，有多少行由筛选数组决定。下面部分就是collectionViewCell

<p><p>

![img](https://github.com/carrot1994/FilterMovieDemo/blob/master/amazing.gif)


