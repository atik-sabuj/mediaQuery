import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class SeipOverview extends StatelessWidget {
  const SeipOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('BACKGROUND',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(height: 15,),
          Text('1. The economy of Bangladesh is growing steadily benefiting from reforms and increasing openness. Annual GDP growth has accelerated from 4.1% in the period FY1973-1978 to 6.2% in FY2008-2013. Excitingly, since FY 2015-16 Bangladesh has been experiencing more than 7.0% GDP growth which crossed 8.0% in 2018-19 that gives the country an aspiration to claim up to double digits. Literacy rate has increased over past decades, so has school enrollment, and particularly girls and women’s participation in education. Population and labor force is predominantly young with more than a third in the 15-34 age group in 2010. Bangladesh is well-placed to benefit from the demographic dividend up to 2050 and perhaps beyond due to decline in fertility rates which, combined with effective policies and markets, triggers faster rates of economic growth and human development'),
          SizedBox(height: 5,),
          Text('2. This may be reinforced by the growth of labor productivity through skills development and technological progress especially Information and Communication Technology (ICT) driven move towards a knowledge economy. However, skill is recognized after infrastructure and energy as the prime factor to industrial growth, productivity, export diversification and producing high value products. It needs to be mentioned here that the Asian Development Bank’s (ADB) Bangladesh Country Partnership Strategy (for 2012–2016) identifies the low competitiveness of firms as a key constraint to growth particularly the low skills and low productivity of the workforce'),
          SizedBox(height: 5,),
          Text('3. Foreign remittances play a very vital role in Bangladesh economy. Bangladeshi expatriates are the main source of this remittance. But most of the Bangladeshis working abroad are unskilled or semiskilled are sending very low remittance when compared to South East Asian Countries. For steady and higher remittance inflows, enhancement of skills of the aspirant migrant workers has no alternative.'),
          SizedBox(height: 5,),
          Text('4. To coordinate the existing skills development and training programs sporadically being implemented by about 23 ministries and divisions, the Government has formulated National Skills Development Policy, 2011. To run the skills development programs in a holistic, coordinated and standardized way the Government has recently established National Skills Development Authority (NSDA) which will bring all skills development activities under one umbrella to ensure uniform quality and standard across the country. Side by side with the government’s fiscal support to the skills development programs additional source of funding will be ensured through National Human Resource Development Fund (NHRDF) which has already been established. Deserving public and private training institutes will benefit from this fund to carry on their training activities.'),
          SizedBox(height: 15,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('SKILLS FOR EMPLOYMENT INVESTMENT PROGRAM (SEIP)',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          Text('1. Asian Development Bank (ADB) signed a Multi-Tranche Financing Facility (MFF) Agreement with Bangladesh Government in 2014 in order to support long-term and comprehensive skills development efforts in Bangladesh assessing its potential contribution to higher GDP growth by skilling and up-skilling a large number of working age people in priority sectors. Swiss Agency for Development and Cooperation (SDC) is also co-financing the program in the 1st.'),
          SizedBox(height: 5,),
          Text('2. Finance Division is the executing agency of the SEIP project while three Ministries (Ministry of Expatriate Welfare, Education and Industries), Bangladesh Bank, PKSF and 13 Industry Associations are partnering with this Division. Apart from this, BRTC under the Ministry of Ministry Road Transport & Highways is working with this project to develop 1,00,000 trained< and licensed drivers to drastically reduce road accidents. Support to Skills Development Coordination and Monitoring Unit (SDCMU) is working as the implementing agency.'),
          SizedBox(height: 5,),
          Text('3. The Skills Development Coordination and Monitoring Unit (SDCMU) is headed by the Executive Project Director who is assisted by 04 Deputy Executive Project Directors, 10 Assistant Executive Project Directors and a team of Specialists. A Project Management Unit (PMU) is also working at Finance Division headed by Finance Secretary. Policy issues are dealt by the PMU alongside overall supervision of the project.'),
          SizedBox(height: 5,),
          Text('4. ADB and SDC have been jointly financing the first tranche of the program and the industry associations are also sharing a percentage of the total cost. SDC is, however, not financing the second and third tranche activities due to their internal policy changes. The total cost of SEIP project for the entire period all three tranches (2014 to 2024) is estimated at BDT 3712.33 crore.'),
          SizedBox(height: 10,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('BITBIRDS SOLUTIONS WITH BASIS-SEIP PROGRAM',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          Text('bitBirds Solutions is the member of BASIS and works with various areas of IT and ITES Software Development, IT support and Network Solutions since 2012. bitBirds Solutions is well equipped with competent and professional employees. To produce skilled manpower in this industry and to employ them, bitBirds Solutions has its own training institute named PencilBox Training Institute which has very well decorative and modern technology based well equipped training labs. bitBirds Solutions has its own pool of trainers who have the theory knowledge as well as the hands on knowledge to skill up the fresher. bitBirds Solutions directly offers job the best trainees and guides the other trainees to scale them up.'),
          SizedBox(height: 10,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('NUMBER OF COURSES WE OFFERED:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          Material(
            elevation: 2.0,
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Graphics & UI Design'),
              // trailing: ElevatedButton(
              //   onPressed: () async{
              //     String url = "https://seip-fd.gov.bd/competency/competency-standards-assessment-guide-for-graphic-design/";
              //     var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
              //     if(urllaunchable){
              //       await launch(url); //launch is from url_launcher package to launch URL
              //     }else{
              //       print("URL can't be launched.");
              //     }
              //   },
              //   child: Text('Outline'),
              // ),
            ),
          ),
          SizedBox(height: 4,),
          Material(
            elevation: 2.0,
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Mobile Application Development- Android'),
              // trailing: ElevatedButton(
              //   onPressed: () async{
              //     String url = "https://seip-fd.gov.bd/competency/competency-standards-assessment-guide-for-mobile-application-development-android/";
              //     var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
              //     if(urllaunchable){
              //       await launch(url); //launch is from url_launcher package to launch URL
              //     }else{
              //       print("URL can't be launched.");
              //     }
              //   },
              //   child: Text('Outline'),
              // ),
            ),
          ),
          SizedBox(height: 4,),
          Material(
            elevation: 2.0,
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Server Administration including Windows Server Management'),
              // trailing: ElevatedButton(
              //   onPressed: () async{
              //     String url = "https://seip-fd.gov.bd/competency/cs-for-server-administration-including-windows-server-management/";
              //     var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
              //     if(urllaunchable){
              //       await launch(url); //launch is from url_launcher package to launch URL
              //     }else{
              //       print("URL can't be launched.");
              //     }
              //   },
              //   child: Text('Outline'),
              // ),
            ),
          ),
          SizedBox(height: 4,),
          Material(
            elevation: 2.0,
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('PHP With Laravel Framework'),
              // trailing: ElevatedButton(
              //   onPressed: () async{
              //     String url = "https://seip-fd.gov.bd/competency/competency-standards-assessment-guide-for-web-development-php/";
              //     var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
              //     if(urllaunchable){
              //       await launch(url); //launch is from url_launcher package to launch URL
              //     }else{
              //       print("URL can't be launched.");
              //     }
              //   },
              //   child: Text('Outline'),
              // ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('HIGHLIGHTS:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('All the offered training programs are totally free.')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('The minimum qualification to get enrolled in this training program is Diploma/ Bachelor / Final year student from any discipline of public or private universities.')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('One trainee can do only one training program under this project.'))
            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('Each trainee will be given allowance by the rules and regulation of the SEIP. Trainee conveyance allowance (BDT100/trainee/day) and refreshment allowance (BDT 50/trainee/day) will be provided by SEIP through trainee’s mobile/regular banking channel at the end of training and assessment on actual attendance basis. It is to be noted that at least 80% attendance for each of the trainees is required for being eligible for these allowances.')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('Women and People with special needs are encouraged to apply.')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('Targeted trainees will be youth and young adults within 18–45 years of age for new entrants.These training programs will be implemented in PencilBox Training Institute. There will be a selection procedure to get chance in these exclusive training programs.')),

            ],
          ),
          SizedBox(height: 20,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('COMPLAIN MANAGEMENT::',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          Text('  If you are facing any kind of difficulties regarding SEIP. Such as:'),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('During Registration')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('During Admission')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('Any type of management issues')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('If you have any trainer issues during class time')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_forward,size: 16,),
              SizedBox(width: 5,),
              Flexible(child: Text('Or any type of problem you have faced')),

            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(width: 10,),
              Flexible(child: Text('You can submit your complaint to us by this link. Our Management will directly contact you. We will hide your Identity. Thank you.')),

            ],
          ),
          SizedBox(height: 25,),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.orangeAccent
          //   ),
          //     onPressed: (){}, child: Text('COMPLAIN HERE'))
        ],
      ),
    );
  }
}