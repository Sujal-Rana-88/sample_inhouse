
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class StyleConstants {



  //Intents Constants
  static var mobile_number="mobile_number";


  //SharedPrefference Constants
  static var is_firt_time="is_firt_time";
  static var login_token="login_token";


  static var primaryTextviewStyle1 = const TextStyle(
    color: CustomColor.textcolor1,
  );

  static var textcolor1Textstyle16w400 =GoogleFonts.inter(
    color: CustomColor.textcolor1,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static var orange_color_variant316w400 =GoogleFonts.inter(
    color: CustomColor.orange_color_variant3,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static var homescreensearchboxTextviewStyle1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CustomColor.bluetextcolor,
  );

  static var foodscreensearchboxTextviewStyle2 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CustomColor.brown_color,
  );

  static var textfieldBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: CustomColor.textfieldcolor,
      width: 2.0,
    ),
  );

  static var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: CustomColor.primarycolor,
      minimumSize: const Size.fromHeight(50), // NEW
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))));
  static var buttonStyleWithWhite = ElevatedButton.styleFrom(
      backgroundColor: CustomColor.grey_border,
      minimumSize: const Size.fromHeight(50), // NEW
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))));

  static var buttonTextstyle =
  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: CustomColor.white);

  static var buttonBlackTextstyle =
  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: CustomColor.black);

  static var whiteTextStyle20700 =
  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var whiteTextStyle20600 =
  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var whiteTextStyle20400 =
  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w400, color: CustomColor.white,
      fontStyle: FontStyle.normal);
  static var whiteTextStyle24w400 =
  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400, color: CustomColor.white,
      fontStyle: FontStyle.normal);
  static var whiteTextStyle24w800 =
  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w800, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var whiteTextStyle14w500 =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var light_blue_color1TextStyle14w400 =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.light_blue_color1,
      fontStyle: FontStyle.normal);
  static var tundoraTextStyle14w500 =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: CustomColor.tundora,
      fontStyle: FontStyle.normal);
  static var primarycolorTextStyle18w600 =
  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: CustomColor.primarycolor,
      fontStyle: FontStyle.normal);


  static var lightWhiteTextStyel14 =
  GoogleFonts.inter(fontSize: 14, color: CustomColor.lightWhite,
      fontStyle: FontStyle.normal);



  static var whiteTextStyle14w800 =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w800, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var whiteTextStyle12w400 =
  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var white_opacity70TextStyle10w400 =
  GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400, color: CustomColor.white_opacity70,
      fontStyle: FontStyle.normal);

  static var white_variantTextStyle16600 =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.white_variant,
      fontStyle: FontStyle.normal);

  static var blackTextStyle16600 =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.black,
      fontStyle: FontStyle.normal);


  static var whiteTextStyle16w600 =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var whiteTextStyle16500 =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: CustomColor.white,
      fontStyle: FontStyle.normal);

  static var whiteTextStyle14500 =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: CustomColor.white,
      fontStyle: FontStyle.normal);
  static var grey_variant1TextStyle14400 =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.grey_variant1,
      fontStyle: FontStyle.normal);

  static var blackTextStyle14w400 =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.black,
      fontStyle: FontStyle.normal);

  static var headingTextstyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w800, color: CustomColor.black);

  static var lightbalcktextstyle400 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.lightblack);

  static var lightbalcktextstyle500 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: CustomColor.lightblack);

  static var lightbalcktextstyle400_16 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: CustomColor.lightblack);

  static var lightbalcktextstyle700_16 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: CustomColor.lightblack);

  static var balcktextstyle400 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: CustomColor.black);

  static var blackstyle14W400 = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.black,fontStyle: FontStyle.normal);

  static var light_blue_colortextstyle20w900 = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w900, color: CustomColor.light_blue_color);
  static var grey_txt_color14w400 = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.grey_txt_color);

  static var balcktextstyle32w700 = GoogleFonts.inter(
      fontSize: 32, fontWeight: FontWeight.w700, color: CustomColor.black);

  static var grey_txt_colorstyle400 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: CustomColor.grey_txt_color);

  static var normalblacktextstyle400 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: CustomColor.normal_black);

  static var normalblacktextstyle500 = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: CustomColor.normal_black);

  static var normalblacktextstyle700 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w700, color: CustomColor.normal_black);

  static var orangetextstyle400 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: CustomColor.orangecolor);

  static var orangetextstyle600 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: CustomColor.orangecolor);
  static var orangetextstyle16w600 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.orangecolor);

  static var black_variant_color1style14w600 = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w600, color: CustomColor.black_variant_color1);

  static var lightblueTextstyle12w500 = GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w500, color: CustomColor.lightblue);
  static var lightblueTextstyle14w500 = GoogleFonts.inter(

      fontSize: 14, fontWeight: FontWeight.w500, color: CustomColor.lightblue);
  static var lightblueTextstyle14w600 = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w600, color: CustomColor.lightblue);

  static var lightblueTextstyle14w600withlinethrough = GoogleFonts.inter(
      decorationThickness: 2,decorationColor: Color(0xFF686868),decoration: TextDecoration.lineThrough,
      fontSize: 14, fontWeight: FontWeight.w600, color: CustomColor.lightblue);

  static var light_greytextstyle500 = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, color: CustomColor.light_grey);


  static var bluetextstyle500 =const TextStyle(
      decoration:TextDecoration.underline,
      fontSize: 16,
      color: CustomColor.lightblue,
      fontWeight: FontWeight.w500);

  static var header2=const TextStyle(
      fontSize: 16,
      color: CustomColor.black,
      fontWeight: FontWeight.w500
  );

  static var black20w700=GoogleFonts.inter(
      fontSize: 20,
      color: CustomColor.black,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal
  );

  static var black50012=const TextStyle(
      fontSize: 12,
      color: CustomColor.black,
      fontWeight: FontWeight.w500
  );
  static var labelcolor40012=const TextStyle(
      fontSize: 12,
      color: CustomColor.labelcolor,
      fontWeight: FontWeight.w400
  );

  static var orange20w700=GoogleFonts.inter(
      fontSize: 20,
      color: CustomColor.orange_bold_color,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal
  );


  static var header3=const TextStyle(
      fontSize: 16,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w600
  );

  static var header5=const TextStyle(
      fontSize: 18,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w600
  );

  static var header7=const TextStyle(
      fontSize: 18,
      color: CustomColor.black,
      fontWeight: FontWeight.w600
  );

  static var blackTextColor16w600=const TextStyle(
      fontSize: 16,
      color: CustomColor.black,
      fontWeight: FontWeight.w600
  );

  static var header7white=const TextStyle(
      fontSize: 18,
      color: CustomColor.white,
      fontWeight: FontWeight.w600
  );


  static var header4= GoogleFonts.inter(
      fontSize: 20,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal
  );
  static var white_textstyle18w700= GoogleFonts.inter(
      fontSize: 18,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal
  );

  static var white_textstyle16w300_with_strike= GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.white,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.lineThrough

  );

  static var header6=const TextStyle(
      fontSize: 20,
      color: CustomColor.blackshade,
      fontWeight: FontWeight.w500
  );

  static var Subheader=const TextStyle(
      fontSize: 16,
      color: CustomColor.icon_color,
      fontWeight: FontWeight.w400
  );

  static var icon_colorTextstyle14w400=const TextStyle(
    fontSize: 14,
    color: CustomColor.icon_color,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static var icon_colorgooglefontTextstyle14w400=GoogleFonts.inter(
      fontSize: 14,
      color: CustomColor.icon_color,
      fontWeight: FontWeight.w400,
      fontStyle:  FontStyle.normal
  );



  static var sub_header1=GoogleFonts.inter(
      fontSize: 14,
      color: CustomColor.lightblacktextcolor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );
  static var blacktextcolor16w400=GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );

  static var blacktextcolor14w500=GoogleFonts.inter(
      fontSize: 14,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );
  static var lightblacktextcolor16w500=GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.lightblacktextcolor,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );


  static var lightblacktextcolor16w500lienthrough=GoogleFonts.inter(
    fontSize: 16,
    color: CustomColor.lightblacktextcolor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decorationThickness: 2,decorationColor: CustomColor.lightblacktextcolor,decoration: TextDecoration.lineThrough,
  );
  static var lightblacktextcolor14w500=GoogleFonts.inter(
      fontSize: 14,
      color: CustomColor.lightblacktextcolor,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );  static var lightblacktextcolor16w600=GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.lightblacktextcolor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal
  );
  static var sub_header2=GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.lightblacktextcolor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );

  static var lightblacktextcolorTextstyle16w600=GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.lightblacktextcolor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal
  );

  static var green_colorTextstyle15w500=GoogleFonts.inter(
      fontSize: 14,
      color: CustomColor.green_color,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );
  static var burgendy_colorTextstyle15w500=GoogleFonts.inter(
      fontSize: 14,
      color: CustomColor.burgendy_color,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );
  static var lightblacktextcolorTextstyle18w400=GoogleFonts.inter(
      fontSize: 18,
      color: CustomColor.lightblacktextcolor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );
  static var grey_variant_color1Textstyle16w600=GoogleFonts.inter(
      fontSize: 25,
      color: CustomColor.grey_variant_color1,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal
  );

  static var whitecolorTextstyle16w600=GoogleFonts.inter(
      fontSize: 17,
      color: CustomColor.white,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal
  );

  static var lightblacktextcolorw400= GoogleFonts.inter(
      fontWeight:FontWeight.w600,
      fontSize: 13,
      letterSpacing: -0.33,
      color: CustomColor.lightblacktextcolor,
      fontStyle: FontStyle.normal
  );
  static var blacktextcolorw400= GoogleFonts.inter(
      fontWeight:FontWeight.w600,
      fontSize: 13,
      letterSpacing: -0.33,
      color: CustomColor.blacktextcolor,
      fontStyle: FontStyle.normal
  );
  static var lightblacktextcolor12w500= GoogleFonts.inter(
      fontWeight:FontWeight.w600,
      fontSize: 13,
      letterSpacing: -0.33,
      color: CustomColor.lightblacktextcolor,
      fontStyle: FontStyle.normal
  );
  static var blacktextcolor16w500= GoogleFonts.inter(
      fontWeight:FontWeight.w500,
      fontSize: 16,
      letterSpacing: -0.33,
      color: CustomColor.blacktextcolor,
      fontStyle: FontStyle.normal
  );

  static var blacktextcolor18w500= GoogleFonts.inter(
      fontWeight:FontWeight.w600,
      fontSize: 18,
      letterSpacing: -0.33,
      color: CustomColor.lightblacktextcolor,
      fontStyle: FontStyle.normal
  );
  static var textcolor114w400= GoogleFonts.inter(
      fontWeight:FontWeight.w400,
      fontSize: 14,
      letterSpacing: -0.33,
      color: CustomColor.lightblacktextcolor,
      fontStyle: FontStyle.normal
  );
  static var grey_color_variant414w500= GoogleFonts.inter(
      fontWeight:FontWeight.w500,
      fontSize: 14,
      letterSpacing: -0.33,
      color: CustomColor.grey_color_variant4,
      fontStyle: FontStyle.normal
  );

  static var brown_color_variant114w500= GoogleFonts.inter(
      fontWeight:FontWeight.w500,
      fontSize: 14,
      letterSpacing: -0.33,
      color: CustomColor.brown_color_variant1,
      fontStyle: FontStyle.normal
  );


  static var blacktextcolorW500=const TextStyle(
      fontSize: 16,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w500
  );

  static var blacktextcolor16W400=const TextStyle(
      fontSize: 16,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w400
  );

  static var blacktextcolorW800= GoogleFonts.inter(
      fontSize: 20,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.italic

  );
  static var blacktextcolor16W500= GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal

  );

  static var blacktextcolor24W600= GoogleFonts.inter(
      fontSize: 24,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal

  );

  static var blacktextcolor24W700= GoogleFonts.inter(
      fontSize: 24,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal

  );  static var blacktextcolor16W600= GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal

  );

  static var blacktextcolor20W600= GoogleFonts.inter(
      fontSize: 20,
      color: CustomColor.blacktextcolor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal

  );

  static var grey_color_variant16W400= GoogleFonts.inter(
      fontSize: 16,
      color: CustomColor.grey_color_variant,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal

  );


  static var headingTextstyle2 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w700, color: CustomColor.black);

  static var headingTextstyleskyblue2 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.lightblue);

  static var orangeBoldTextColor=const TextStyle(
      fontSize: 16,fontWeight: FontWeight.w600,color: CustomColor.orange_bold_color
  );

  static var orangelabelTextColor=const TextStyle(
      fontSize: 16,fontWeight: FontWeight.w600,color: CustomColor.orange_bold_color
  );

  static var orangelabelTextColorw400=const TextStyle(
      fontSize: 16,fontWeight: FontWeight.w600,color: CustomColor.orange_bold_color
  );
  static var orangelabelTextColor11w700=const TextStyle(
      fontSize: 11,fontWeight: FontWeight.w700,color: CustomColor.orange_bold_color
  );

  static var homeScrrenLinearGradiant= const LinearGradient(
    colors: [CustomColor.lightSkyblue, CustomColor.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var blueLinearGradiant= const LinearGradient(
    colors: [CustomColor.blue_variant_color4, CustomColor.blue_variant_color5],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static var saleOfferLinearGradiant= const LinearGradient(
    colors: [CustomColor.light_sky_blue, CustomColor.lightblue],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static var FoofScrrenLinearGradiant= const LinearGradient(
    colors: [CustomColor.light_orange, CustomColor.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var topRoundedContainer=const RoundedRectangleBorder(
      borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0)));

  static var topRoundedDecoration= const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 20.0,
      ),
    ],
    color: CustomColor.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  static var foofScrrenLinearGradiant= const LinearGradient(
    colors: [CustomColor.light_orange, CustomColor.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static blacktextstyle16w600(Color textcolor) {
    return  GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color:textcolor);
  }
  static blacktextstyle16w500(Color textcolor) {
    return  GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w500, color: textcolor);
  }
  static blacktextstyle16w400(Color textcolor) {
    return  GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, color: textcolor);
  }

  static blacktextstyle10w400(Color textcolor) {
    return  GoogleFonts.inter(
        fontSize: 10, fontWeight: FontWeight.w400, color: textcolor);
  }

  static textstyle16w600(Color textcolor) {
    return  GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: textcolor);
  }
}