import '../../feature/about_us/presentation/about_us/about_us_page.dart';
import '../../feature/contact/presentation/contact/contact_page.dart';
import '../../feature/esg/presentation/esg/esg_page.dart';
import '../../feature/new/presentation/new/new_page.dart';
import '../../feature/partner/presentation/partner/partner_page.dart';
import '../../feature/product/presentation/product/product_page.dart';
import '../../feature/recruitment/presentation/recruitment/recruitment_page.dart';

class RoutePath {
  RoutePath();

  /// {@macro constecon.lib.feature.recruitment.presentation.recruitment}
  static const String recruitment = RecruitmentPage.name;

  /// {@macro constecon.lib.feature.esg.presentation.esg}
  static const String esg = EsgPage.name;

  /// {@macro constecon.lib.feature.about.us.presentation.about.us}
  static const String aboutUs = AboutUsPage.name;

  /// {@macro constecon.lib.feature.contact.presentation.contact}
  static const String contact = ContactPage.name;

  /// {@macro constecon.lib.feature.home.presentation.home}
  /// static const String home = HomePage.name;
  static const String home = '/';

  /// {@macro constecon.lib.feature.new.presentation.new}
  static const String news = NewPage.name;

  /// {@macro constecon.lib.feature.partner.presentation.partner}
  static const String partner = PartnerPage.name;

  /// {@macro constecon.lib.feature.product.presentation.product}
  static const String product = ProductPage.name;
}
