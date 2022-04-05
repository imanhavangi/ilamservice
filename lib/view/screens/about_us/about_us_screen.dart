import 'package:flutter/material.dart';

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
        width: MediaQuery.of(context).size.width,
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
                  color: Color(0xf4f4f4f4),
                ),
              ).pLTRB(20, 0, 20, 0),
            ),
          ]),
        ),
      ),
    );
  }
}
