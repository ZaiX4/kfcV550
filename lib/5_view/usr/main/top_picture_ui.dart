import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhihuribao/5_view/fun/xiaomi13_mm.dart';
import '../../../4_controller/usr/main_pg/top_picture_c.dart';
import 'package:cached_network_image/cached_network_image.dart';

//使用flutter构建一个组件,该组建由五个图片(由url提供,可自动缓存)构成,五个图片位于pageView下,可以左右滑动
class TopPictureUi extends StatelessWidget {

  //获取控制器
  final TopPictureC topPictureC = Get.find();

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double mm = getMM(context, 1);

    //初始化数据
    topPictureC.load();
    var pageController = topPictureC.pageController;

    return Obx(() {
      try {
        /******************************
         * 首先是图片,然后是遮盖渐变层,然后是标题,然后是动画点
         ******************************/
        Widget w1=Container(
          width: screenWidth,
          height: 65 * mm,
          child: PageView.builder(
            controller: pageController,
            itemCount: topPictureC.imgUrlList.length,
            itemBuilder: (context, index) {

              /******************************
               * 渐变层
               ******************************/
              Widget w1 = Container(
                width: screenWidth,
                height: 30*mm,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      topPictureC.imageHueList[index].withOpacity(0),
                      topPictureC.imageHueList[index].withOpacity(1),
                      topPictureC.imageHueList[index].withOpacity(1)
                    ],
                  ),
                ),
              );
              w1 = Positioned(
                child: w1,
                right: 0,
                bottom: 0,
              );

              /******************************
               * 这是图片
               ******************************/
              Widget w2 = Container(
                width: screenWidth,
                height: 65*mm,
                child: CachedNetworkImage(
                  imageUrl: topPictureC.imgUrlList[index],
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                  fit: BoxFit.cover,
                ),
              );
              w2 = Positioned(
                child: w2,
                left: 0,
                top: 0,
              );

              /******************************
               * 这是标题
               ******************************/
              Widget w3 = Container(
                width: screenWidth-6*mm,
                child: Text(
                    topPictureC.titleList[index],
                    style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WR',
                    fontSize: 3.6*mm,
                    fontWeight: FontWeight.bold
                ),
                ),
              );
              w3 = Container(
                width: screenWidth,
                child: Center(
                  child: w3,
                ),
              );

              /******************************
               * 这是合并
               ******************************/
              Widget w4 = Container(
                width: screenWidth,
                child: Row(
                  children: [
                    Container(width: 3*mm,),
                    Text(
                      "${topPictureC.authorList[index]}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'WR',
                        fontSize: 2*mm,
                      ),
                    ),
                  ],
                )
              );

              /******************************
               * 综合
               *****************************/
              Widget w5 = Column(
                children: [
                  w3,
                  Container(height: 1.5*mm,),
                  w4
                ],
              );

              w5 = Positioned(
                child: w5,
                left: 0,
                bottom: 4.5*mm,
              );

              return Container(
                width: screenWidth,
                height: 65*mm,
                child: Stack(
                  children: [
                    w2,
                    w1,
                    w5,
                  ],
                ),
              );
            },
          ),
        );

        w1 = Positioned(child: w1, left: 0, top: 0,);

        /******************************
         * 这是动画点
         ******************************/
        Widget w3=Container(
          child: Row(
            children: List.generate(10, (index) {

              if(index%2==0)return Container(width: 0.9*mm,);
              var i=index/2;
              //计算距离,如果距离大于1,则保持0.5mm圆形,如果距离小于1,计算公式为(1-距离)*2+0.5mm,如果距离大于4,则保持0.5mm圆形
              var d = topPictureC.nowStoryIndex.value+0.5-i;
              d= d < 0 ? -d : d;
              if(d>4){
                d-=4;
                d=1-d;
              }
              var w = (d>=1)?0.6*mm:((1-d)*2*mm+0.6*mm);
              var o = (d>=1)?0.5:(0.5*(1-d)+0.5);
              return Container(
                width: w,
                height: 0.6 * mm,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(o),
                  borderRadius: BorderRadius.circular(0.5*mm),
                ),
              );

            }),
          )
        );

        w3 = Positioned(child: w3, right: 4*mm, bottom: 3*mm,);

        /******************************
         * 综合
         *****************************/
        return Container(
          width: screenWidth,
          height: 65 * mm,
          child: Stack(
            children: [
              w1,
              w3
            ]
          ),
        );
      } catch (e) {
        print(e);
        return Container(
          width: screenWidth,
          height: 65 * mm,
          color: Colors.redAccent,
        );
      }
    });

  }
}