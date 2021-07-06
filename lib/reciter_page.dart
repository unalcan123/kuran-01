import 'package:flutter/material.dart';
import 'package:kuran_01/readPage.dart';

class ReciterPage extends StatefulWidget {
  final name;
  final id;
  final server;

  const ReciterPage({Key? key, this.name, this.id, this.server})
      : super(key: key);

  @override
  _ReciterPageState createState() => _ReciterPageState();
}

class _ReciterPageState extends State<ReciterPage> {
  late List<Sure> _sureListesi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sureListesi = [
      Sure("	001	", "	Fâtiha Sûresi	", "	7	", "	5	"),
      Sure("	002	", "	Bakara Sûresi	", "	286	", "	87	"),
      Sure("	003	", "	Âl-i İmrân Sûresi	", "	200	", "	89	"),
      Sure("	004	", "	Nisâ Sûresi	", "	176	", "	92	"),
      Sure("	005	", "	Mâide Sûresi	", "	120	", "	112	"),
      Sure("	006	", "	En'âm Sûresi	", "	165	", "	55	"),
      Sure("	007	", "	A'râf Sûresi	", "	206	", "	39	"),
      Sure("	008	", "	Enfâl Sûresi	", "	75	", "	88	"),
      Sure("	009	", "	Tevbe Sûresi	", "	129	", "	113	"),
      Sure("	010	", "	Yunus Sûresi	", "	109	", "	51	"),
      Sure("	011	", "	Hûd Sûresi	", "	123	", "	52	"),
      Sure("	012	", "	Yusuf Sûresi	", "	111	", "	53	"),
      Sure("	013	", "	Ra'd Sûresi	", "	43	", "	96	"),
      Sure("	014	", "	İbrahim Sûresi	", "	52	", "	72	"),
      Sure("	015	", "	Hicr Sûresi	", "	99	", "	54	"),
      Sure("	016	", "	Nahl Sûresi	", "	128	", "	70	"),
      Sure("	017	", "	İsrâ Sûresi	", "	111	", "	50	"),
      Sure("	018	", "	Kehf Sûresi	", "	110	", "	69	"),
      Sure("	019	", "	Meryem Sûresi	", "	98	", "	44	"),
      Sure("	020	", "	Tâ-Hâ Sûresi	", "	135	", "	45	"),
      Sure("	021	", "	Enbiyâ Sûresi	", "	112	", "	73	"),
      Sure("	022	", "	Hac Sûresi	", "	78	", "	103	"),
      Sure("	023	", "	Mü'minûn Sûresi	", "	118	", "	74	"),
      Sure("	024	", "	Nûr Sûresi	", "	64	", "	102	"),
      Sure("	025	", "	Furkan Sûresi	", "	77	", "	42	"),
      Sure("	026	", "	Şuarâ Sûresi	", "	227	", "	47	"),
      Sure("	027	", "	Neml Sûresi	", "	93	", "	48	"),
      Sure("	028	", "	Kasas Sûresi	", "	88	", "	49	"),
      Sure("	029	", "	Ankebût Sûresi	", "	69	", "	85	"),
      Sure("	030	", "	Rûm Sûresi	", "	60	", "	84	"),
      Sure("	031	", "	Lokman Sûresi	", "	34	", "	57	"),
      Sure("	032	", "	Secde Sûresi	", "	30	", "	75	"),
      Sure("	033	", "	Ahzâb Sûresi	", "	73	", "	90	"),
      Sure("	034	", "	Sebe' Sûresi	", "	54	", "	58	"),
      Sure("	035	", "	Fâtır Sûresi	", "	45	", "	43	"),
      Sure("	036	", "	Yâsin Sûresi	", "	83	", "	41	"),
      Sure("	037	", "	Sâffât Sûresi	", "	182	", "	56	"),
      Sure("	038	", "	Sâd Sûresi	", "	88	", "	38	"),
      Sure("	039	", "	Zümer Sûresi	", "	75	", "	59	"),
      Sure("	040	", "	Mü'min Sûresi	", "	85	", "	60	"),
      Sure("	041	", "	Fussilet Sûresi	", "	54	", "	61	"),
      Sure("	042	", "	Şûrâ Sûresi	", "	53	", "	62	"),
      Sure("	043	", "	Zuhruf Sûresi	", "	89	", "	63	"),
      Sure("	044	", "	Duhân Sûresi	", "	59	", "	64	"),
      Sure("	045	", "	Câsiye Sûresi	", "	37	", "	65	"),
      Sure("	046	", "	Ahkaf Sûresi	", "	35	", "	66	"),
      Sure("	047	", "	Muhammed Sûresi	", "	38	", "	95	"),
      Sure("	048	", "	Fetih Sûresi	", "	29	", "	111	"),
      Sure("	049	", "	Hucurât Sûresi	", "	18	", "	106	"),
      Sure("	050	", "	Kaf Sûresi	", "	45	", "	34	"),
      Sure("	051	", "	Zâriyât Sûresi	", "	60	", "	67	"),
      Sure("	052	", "	Tûr Sûresi	", "	49	", "	76	"),
      Sure("	053	", "	Necm Sûresi	", "	62	", "	23	"),
      Sure("	054	", "	Kamer Sûresi	", "	55	", "	37	"),
      Sure("	055	", "	Rahmân Sûresi	", "	78	", "	97	"),
      Sure("	056	", "	Vâkıa Sûresi	", "	96	", "	46	"),
      Sure("	057	", "	Hadid Sûresi	", "	29	", "	94	"),
      Sure("	058	", "	Mücâdele Sûresi	", "	22	", "	105	"),
      Sure("	059	", "	Haşr Sûresi	", "	24	", "	101	"),
      Sure("	060	", "	Mümtehine Sûresi	", "	13	", "	91	"),
      Sure("	061	", "	Saf Sûresi	", "	14	", "	109	"),
      Sure("	062	", "	Cum'a Sûresi	", "	11	", "	110	"),
      Sure("	063	", "	Münâfikûn Sûresi	", "	11	", "	104	"),
      Sure("	064	", "	Teğabün Sûresi	", "	18	", "	108	"),
      Sure("	065	", "	Talâk Sûresi	", "	12	", "	99	"),
      Sure("	066	", "	Tahrim Sûresi	", "	12	", "	107	"),
      Sure("	067	", "	Mülk Sûresi	", "	30	", "	77	"),
      Sure("	068	", "	Kalem Sûresi	", "	52	", "	2	"),
      Sure("	069	", "	Hâkka Sûresi	", "	52	", "	78	"),
      Sure("	070	", "	Meâric Sûresi	", "	44	", "	79	"),
      Sure("	071	", "	Nuh Sûresi	", "	28	", "	71	"),
      Sure("	072	", "	Cin Sûresi	", "	28	", "	40	"),
      Sure("	073	", "	Müzzemmil Sûresi	", "	20	", "	3	"),
      Sure("	074	", "	Müddessir Sûresi	", "	56	", "	4	"),
      Sure("	075	", "	Kıyamet Sûresi	", "	40	", "	31	"),
      Sure("	076	", "	İnsan Sûresi	", "	31	", "	98	"),
      Sure("	077	", "	Mürselât Sûresi	", "	50	", "	33	"),
      Sure("	078	", "	Nebe' Sûresi	", "	40	", "	80	"),
      Sure("	079	", "	Nâziât Sûresi	", "	46	", "	81	"),
      Sure("	080	", "	Abese Sûresi	", "	42	", "	24	"),
      Sure("	081	", "	Tekvir Sûresi	", "	29	", "	7	"),
      Sure("	082	", "	İnfitâr Sûresi	", "	19	", "	82	"),
      Sure("	083	", "	Mutaffifin Sûresi	", "	36	", "	86	"),
      Sure("	084	", "	İnşikak Sûresi	", "	25	", "	83	"),
      Sure("	085	", "	Bürûc Sûresi	", "	22	", "	27	"),
      Sure("	086	", "	Târık Sûresi	", "	17	", "	36	"),
      Sure("	087	", "	A'lâ Sûresi	", "	19	", "	8	"),
      Sure("	088	", "	Gâşiye Sûresi	", "	26	", "	68	"),
      Sure("	089	", "	Fecr Sûresi	", "	30	", "	10	"),
      Sure("	090	", "	Beled Sûresi	", "	20	", "	35	"),
      Sure("	091	", "	Şems Sûresi	", "	15	", "	26	"),
      Sure("	092	", "	Leyl Sûresi	", "	21	", "	9	"),
      Sure("	093	", "	Duhâ Sûresi	", "	11	", "	11	"),
      Sure("	094	", "	İnşirâh Sûresi	", "	8	", "	12	"),
      Sure("	095	", "	Tin Sûresi	", "	8	", "	28	"),
      Sure("	096	", "	Alak Sûresi	", "	19	", "	1	"),
      Sure("	097	", "	Kadir Sûresi	", "	5	", "	25	"),
      Sure("	098	", "	Beyyine Sûresi	", "	8	", "	100	"),
      Sure("	099	", "	Zilzâl Sûresi	", "	8	", "	93	"),
      Sure("	100	", "	Âdiyât Sûresi	", "	11	", "	14	"),
      Sure("	101	", "	Kâria Sûresi	", "	11	", "	30	"),
      Sure("	102	", "	Tekâsür Sûresi	", "	8	", "	16	"),
      Sure("	103	", "	Asr Sûresi	", "	3	", "	13	"),
      Sure("	104	", "	Hümeze Sûresi	", "	9	", "	32	"),
      Sure("	105	", "	Fil Sûresi	", "	5	", "	19	"),
      Sure("	106	", "	Kureyş Sûresi	", "	4	", "	29	"),
      Sure("	107	", "	Mâûn Sûresi	", "	7	", "	17	"),
      Sure("	108	", "	Kevser Sûresi	", "	3	", "	15	"),
      Sure("	109	", "	Kâfirûn Sûresi	", "	6	", "	18	"),
      Sure("	110	", "	Nasr Sûresi	", "	3	", "	114	"),
      Sure("	111	", "	Tebbet Sûresi	", "	5	", "	6	"),
      Sure("	112	", "	İhlâs Sûresi	", "	4	", "	22	"),
      Sure("	113	", "	Felâk Sûresi	", "	5	", "	20	"),
      Sure("	114	", "	Nâs Sûresi	", "	6	", "	21	"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reciter: ' + widget.name),
      ),
      body: ListView.builder(
        itemCount: _sureListesi.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.orange[200],
            child: ListTile(
              title: Text(_sureListesi[index].SureName),
              //  subtitle: Text(_sureListesi[index].),
              trailing: Icon(
                Icons.play_circle_fill,
                size: 50,
              ),
              leading: CircleAvatar(
                maxRadius: 20,
                child: Text(_sureListesi[index].Sira),
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailReadPage(
                      ayetSira: _sureListesi[index].Sira,
                      name: widget.name,
                      server: widget.server,
                      sureName: _sureListesi[index].SureName,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Sure {
  String Sira;
  String SureName;
  String AyetSayisi;
  String NuzulSurasui;
  Sure(this.Sira, this.SureName, this.AyetSayisi, this.NuzulSurasui);
}
