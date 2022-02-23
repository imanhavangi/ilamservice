import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ilamservice/view/screens/about_us/widgets/card_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text(
          "درباره ایلام سرویس",
          style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xff4e4f51),
              Color(0xff808186),
              Color(0xff4e4f51),
            ])),
        child: SingleChildScrollView(
          child: Column(children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: const Text(
                """ایلام سرویس یکی از محصولات پلتفرمی شرکت گرماسازان پشتکوه زاگرس است که در سال1400 هجری شمسی،  تاسیس شد.
ایلام سرویس این امکان را به کاربران خود می دهد تا هر خدمتی را که در منزل مورد نیازشان است از طریق وبسایت و اپلیکیشن به سهولت و در هر ساعتی از شبانه روز سفارش دهند. این خدمات از نظافت و پذیرایی گرفته تا بازسازی و دکوراسیون و تعمیرات،فروشگاه لوازم خانگی و ساختمانی  را شامل می شوند.
این پلتفرم با استفاده از دانش فناوری اطلاعات تیم توسعه دهنده خود، انواع نیروهای خدماتی متخصص و معتمد را مستقیما به متقاضیان آن خدمات متصل میکند.
از مهمترین اهداف این پلتفرم، میتوان به موارد زیر اشاره کرد:
  - رفع دغدغه های مربوط به خدمات منزل برای مشتریان
  - ایجاد تحول در زمینه خدمات منزل
  - ایجاد اشتغال برای بسیاری از کسانی که توانایی انجام کار فنی دارند، ولی به دلیل نبود سرمایه قادر به معرفی خود و ارتباط با مشتری نهایی نیستند
نیروهای خدماتی (ایلام سرویس) دارای گواهی عدم سوء پیشینه و عدم اعتیاد بوده و از دیگر فیلترهای تایید صلاحیت ایلام سرویس عبور کرده اند تا مشتری بتواند به آنها اعتماد کند.
همچنین، به دلیل سیستم ارزیابی و امتیازدهی توسط مشتریان، کیفیت خدمات ارائه شده همواره رو به بهبود بوده و در نهایت خدمات با کیفیت بالاتری نسبت به میانگین کیفیت خدمات سنتی ارائه میشود.
ایلام سرویس فرصت مناسبی برای نیروهای نظافتی، پرستاری، باغبانی، تعمیراتی و تاسیساتی است که در هر زمان و مکانی که مدنظرشان است، به کسب درآمد بپردازند.""",
                style: TextStyle(
                  fontFamily: 'iransans',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ).pLTRB(20, 0, 20, 0),
            ),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'تماس با ایلام سرویس',
                style: TextStyle(
                    fontFamily: 'iransans',
                    fontSize: 26,
                    color: Color(0xfff04a24)),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, shape: const StadiumBorder()),
                onPressed: () async {
                  await launch('https://wa.me/+989188421092');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                    ),
                    Text(
                      'واتساپ',
                      style: TextStyle(fontFamily: 'iransans'),
                    ),
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, shape: const StadiumBorder()),
                onPressed: () async {
                  await launch('https://www.instagram.com/ilam_service1400');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.instagram,
                    ),
                    Text(
                      'اینستاگرام',
                      style: TextStyle(fontFamily: 'iransans'),
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, shape: const StadiumBorder()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.telegram,
                    ),
                    Text(
                      '+۹۸۹۱۸۸۴۲۱۰۹۲  :تلگرام',
                      style: TextStyle(fontFamily: 'iransans'),
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () async {
                  await launch('tel: +989188421092');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, shape: const StadiumBorder()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.phone,
                    ),
                    Text(
                      'همراه شرکت:   ۰۹۱۸۸۴۲۱۰۹۲',
                      style: TextStyle(fontFamily: 'iransans'),
                    ),
                  ],
                )),
          ]),
        ),
      ),
      // bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
