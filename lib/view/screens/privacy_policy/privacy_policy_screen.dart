import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PrivacyPolicysScreen extends StatelessWidget {
  const PrivacyPolicysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: const Text(
            'سیاست نامه حریم خصوصی',
            style: TextStyle(fontFamily: 'iransans', color: Color(0xfff04a24)),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: const [
                    Text(
                      """
  ایلام سرویس به حریم خصوصی کاربران خود احترام می‌گذارد و متعهد به حفاظت از اطلاعات شخصی است که شما در اختیار آن می‌گذارید و سیاست ایلام سرویس در قبال قرار دادن اطلاعات شخصی کاربران  از جمله تلفن همراه و آدرس از قرار زیر است

""",
                      style: TextStyle(
                          fontFamily: 'iransans', color: Color(0xf4f4f4f4)),
                    ),
                    Text(
                      '۱. درباره ما',
                      style: TextStyle(
                          fontFamily: 'iransans',
                          fontSize: 26,
                          color: Color(0xfff04a24),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
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
                          fontFamily: 'iransans', color: Color(0xf4f4f4f4)),
                    ),
                    Text(
                      '۲. برنامه',
                      style: TextStyle(
                          fontFamily: 'iransans',
                          fontSize: 26,
                          color: Color(0xfff04a24),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      """نرم افزار ایلام سرویس حاوی برنامه های تعمیراتی، خدماتی، ساختمانی، فروشگاهی است که کاربر با کلیک بر روی هرکدام وارد محیط آن میشود و از آیکون های طراحی شده درخواست خود را برای ایلام سرویس ارسال میکند""",
                      style: TextStyle(
                          fontFamily: 'iransans', color: Color(0xf4f4f4f4)),
                    ),
                    Text(
                      '۳. کدام اطلاعات توسط ایلام سرویس جمع‌آوری می‌شود؟',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'iransans',
                          fontSize: 26,
                          color: Color(0xfff04a24),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      """۱. شماره همراه:از شماره همراه برای تماس گرفتن با کاربر جهت انجام خدمت مورد نظر و درخواستی از طرف کاربر استفاده میشود و ایلام سرویس متعهد میشود که شماره کاربر را در اختیار شخص ثالث قرار ندهد
۲. آدرس:از آدرس جهت انجام سفارش یا درخواست کاربر بابت تعمیر لوازم خانگی و حضور متخصص در محل استفاده میشود و ایلام سرویس متعهد میشود آدرس کاربر را در اختیار شخص ثالث قرار ندهد""",
                      style: TextStyle(
                          fontFamily: 'iransans', color: Color(0xf4f4f4f4)),
                    ),
                  ],
                ).pLTRB(20, 0, 20, 0),
              ),
            )));
  }
}
