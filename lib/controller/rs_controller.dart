import 'package:get/get.dart';
import 'package:rsku/model/rs_model.dart';

enum Rsfilter { semua, bpjs, partner, terdekat }

class RsController extends GetxController {
  Rx _choice = Rsfilter.semua.obs;
  RxList<RsModel> listRs = <RsModel>[].obs;

  get choice => _choice.value;

  void changeListData() {
    switch (_choice.value) {
      case Rsfilter.semua:
        listRs.value = [
          RsModel(
            nama: "RSUP Fatmawati",
            alamat: "Jl. RS Fatmawati Cilandak Jakarta Selatan",
            pic:
                "https://static.republika.co.id/uploads/images/inpicture_slide/rumah-sakit-umum-pusat-rsup-fatmawati-jakarta_210824123245-810.jpg",
          ),
          RsModel(
            nama: "RS Pusat Pertamina",
            alamat: "Jl.Kyai Maja No. 43 Jakarta Selatan",
            pic:
                "https://www.pertamedika.co.id/assets/web/img/tentang-kami/img1.jpg",
          ),
          RsModel(
            nama: "RS Suliati Saroso",
            alamat: "Jl. Sunter Permai Raya Tanjung Priok Jakarta Utara",
            pic:
                "https://databank-kpap.jakarta.go.id/uploads/organisasi/rspisulis1.jpg",
          ),
        ];
        break;
      case Rsfilter.bpjs:
        listRs.value = [
          RsModel(
            nama: "RS Bhakti Mulia",
            alamat: "Jl. Aipda Ks. Tubun Jakarta Barat",
            pic:
                "https://d1ojs48v3n42tp.cloudfront.net/provider_location_list/799441_3-2-2020_16-18-10.jpg",
          ),
          RsModel(
            nama: "RSIA Ibnu Sina",
            alamat: "Jl. Dr. Nurdin I Jakarta Barat",
            pic:
                "https://goalkes-images.s3-ap-southeast-1.amazonaws.com/hospitals/kCvTJUt6qocsNR4P12flugZasZPHljgMU4kOtmCI.jpg",
          ),
          RsModel(
            nama: "RS Siloam Kebon Jeruk",
            alamat: "Jl. Perjuangan Kav.8 Jakarta Barat",
            pic:
                "https://mysiloam-api.siloamhospitals.com/public-asset/website-cms/website-cms-16273598588599194.jpg",
          ),
        ];
        break;
      case Rsfilter.partner:
        listRs.value = [
          RsModel(
            nama: "RSUP Dr. Cipto Mangunkusumo",
            alamat: "Jl. Diponegoro No.71, Jakarta Pusat",
            pic:
                "https://pict-b.sindonews.net/dyn/620/pena/news/2021/03/06/173/355998/rscm-dan-rs-pgi-cikini-rumah-sakit-tertua-di-jakarta-axf.jpg",
          ),
          RsModel(
            nama: "RSUP Fatmawati",
            alamat: "Jl. RS Fatmawati Cilandak Jakarta Selatan",
            pic:
                "https://static.republika.co.id/uploads/images/inpicture_slide/rumah-sakit-umum-pusat-rsup-fatmawati-jakarta_210824123245-810.jpg",
          ),
          RsModel(
            nama: "RSAL Dr Mintoharjo",
            alamat: "Jl. Bendungan Hilir No. 117 Jakarta Pusat",
            pic:
                "https://static.konsula.com/images/practice/0001001000/0001000411/rumah-sakit-al-dr-mintohardjo.800x600.png",
          ),
        ];
        break;
      case Rsfilter.terdekat:
        listRs.value = [
          RsModel(
            nama: "RS Pondok Indah",
            alamat: "Jl. Metro Duta Kav. UE Jakarta Selatan",
            pic:
                "https://www.rspondokindah.co.id/uploads/ngc_global_posts/5f0851276bfe7_20200710182943-1.jpeg",
          ),
          RsModel(
            nama: "RSUP Fatmawati",
            alamat: "Jl. RS Fatmawati Cilandak Jakarta Selatan",
            pic:
                "https://static.republika.co.id/uploads/images/inpicture_slide/rumah-sakit-umum-pusat-rsup-fatmawati-jakarta_210824123245-810.jpg",
          ),
          RsModel(
            nama: "RS Pusat Pertamina",
            alamat: "Jl.Kyai Maja No. 43 Jakarta Selatan",
            pic:
                "https://www.pertamedika.co.id/assets/web/img/tentang-kami/img1.jpg",
          ),
        ];
        break;
    }
  }

  void changeChoice(Rsfilter choice) {
    _choice.value = choice;
    print("choice now: $_choice");
    changeListData();
  }
}
