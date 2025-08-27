class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String category;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    this.category = "Umum",
  });

  List<String> getShuffledOptions() {
    final shuffled = List<String>.from(options);
    shuffled.shuffle();
    return shuffled;
  }

  int getCorrectIndexAfterShuffle(List<String> shuffledOptions) {
    return shuffledOptions.indexOf(options[correctAnswerIndex]);
  }
}

List<Question> questions = [
  Question(
    questionText: "Berapakah hasil dari 7 × 8?",
    options: ["54", "56", "64", "72"],
    correctAnswerIndex: 1,
    category: "Matematika",
  ),
  Question(
    questionText: "Jika a = 5 dan b = 3, berapakah a² + b²?",
    options: ["34", "64", "16", "25"],
    correctAnswerIndex: 0,
    category: "Matematika",
  ),
  Question(
    questionText: "Berapakah 30% dari 200?",
    options: ["30", "60", "90", "120"],
    correctAnswerIndex: 1,
    category: "Matematika",
  ),
  Question(
    questionText: "Hasil dari 144 ÷ 12 adalah?",
    options: ["10", "11", "12", "13"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Bentuk desimal dari 3/4 adalah?",
    options: ["0.25", "0.50", "0.75", "1.25"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Nilai dari π (pi) adalah sekitar?",
    options: ["2.14", "3.14", "4.14", "3.41"],
    correctAnswerIndex: 1,
    category: "Matematika",
  ),
  Question(
    questionText: "Hasil dari 15² - 10² adalah?",
    options: ["125", "150", "175", "200"],
    correctAnswerIndex: 0,
    category: "Matematika",
  ),
  Question(
    questionText: "Berapakah FPB dari 24 dan 36?",
    options: ["6", "8", "12", "18"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Jika x + 7 = 15, maka x = ?",
    options: ["6", "7", "8", "9"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Luas persegi dengan sisi 8 cm adalah?",
    options: ["32 cm²", "48 cm²", "64 cm²", "72 cm²"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Volume kubus dengan rusuk 5 cm adalah?",
    options: ["25 cm³", "75 cm³", "100 cm³", "125 cm³"],
    correctAnswerIndex: 3,
    category: "Matematika",
  ),
  Question(
    questionText: "Hasil dari 0.75 × 8 adalah?",
    options: ["4", "5", "6", "7"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Bentuk pecahan dari 0.6 adalah?",
    options: ["1/6", "2/3", "3/5", "6/10"],
    correctAnswerIndex: 3,
    category: "Matematika",
  ),
  Question(
    questionText: "Keliling lingkaran dengan diameter 14 cm adalah?",
    options: ["22 cm", "44 cm", "66 cm", "88 cm"],
    correctAnswerIndex: 1,
    category: "Matematika",
  ),
  Question(
    questionText: "Hasil dari 3/5 + 2/3 adalah?",
    options: ["5/8", "19/15", "1 4/15", "6/8"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Nilai dari √169 adalah?",
    options: ["11", "12", "13", "14"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Jika y - 12 = 20, maka y = ?",
    options: ["8", "18", "28", "32"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Hasil dari 4! (4 faktorial) adalah?",
    options: ["16", "20", "24", "32"],
    correctAnswerIndex: 2,
    category: "Matematika",
  ),
  Question(
    questionText: "Rata-rata dari 5, 7, 9, 11, 13 adalah?",
    options: ["8", "9", "10", "11"],
    correctAnswerIndex: 1,
    category: "Matematika",
  ),
  Question(
    questionText: "Jika 2x = 18, maka x = ?",
    options: ["6", "7", "8", "9"],
    correctAnswerIndex: 3,
    category: "Matematika",
  ),

  Question(
    questionText: "Proses fotosintesis terjadi pada?",
    options: ["Akar", "Batang", "Daun", "Bunga"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Zat yang dihasilkan tumbuhan dalam fotosintesis adalah?",
    options: ["Oksigen", "Nitrogen", "Karbon dioksida", "Hidrogen"],
    correctAnswerIndex: 0,
    category: "IPA",
  ),
  Question(
    questionText: "Planet terbesar dalam tata surya kita adalah?",
    options: ["Bumi", "Jupiter", "Saturnus", "Neptunus"],
    correctAnswerIndex: 1,
    category: "IPA",
  ),
  Question(
    questionText: "Alat pengukur suhu adalah?",
    options: ["Barometer", "Termometer", "Hygrometer", "Speedometer"],
    correctAnswerIndex: 1,
    category: "IPA",
  ),
  Question(
    questionText: "Penyakit yang disebabkan kekurangan vitamin C adalah?",
    options: ["Rabun senja", "Sariawan", "Anemia", "Osteoporosis"],
    correctAnswerIndex: 1,
    category: "IPA",
  ),
  Question(
    questionText: "Hewan yang mengalami metamorfosis sempurna adalah?",
    options: ["Kupu-kupu", "Kecoak", "Belalang", "Kumbang"],
    correctAnswerIndex: 0,
    category: "IPA",
  ),
  Question(
    questionText: "Bagian sel yang berfungsi sebagai pusat kontrol adalah?",
    options: ["Mitokondria", "Nukleus", "Sitoplasma", "Membran sel"],
    correctAnswerIndex: 1,
    category: "IPA",
  ),
  Question(
    questionText: "Sistem peredaran darah manusia termasuk sistem?",
    options: ["Transportasi", "Ekskresi", "Pencernaan", "Pernapasan"],
    correctAnswerIndex: 0,
    category: "IPA",
  ),
  Question(
    questionText: "Enzim yang membantu pencernaan protein adalah?",
    options: ["Amilase", "Lipase", "Pepsin", "Laktase"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Penyakit demam berdarah ditularkan melalui?",
    options: ["Nyamuk Aedes", "Lalat", "Kutu", "Kecoa"],
    correctAnswerIndex: 0,
    category: "IPA",
  ),
  Question(
    questionText: "Benda yang dapat ditarik magnet disebut?",
    options: ["Feromagnetik", "Paramagnetik", "Diamagnetik", "Nonmagnetik"],
    correctAnswerIndex: 0,
    category: "IPA",
  ),
  Question(
    questionText: "Proses perubahan wujud dari padat ke gas disebut?",
    options: ["Mencair", "Membeku", "Menyublim", "Mengembun"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Organ pernapasan pada ikan adalah?",
    options: ["Paru-paru", "Trakea", "Insang", "Kulit"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Sumber energi terbesar bagi bumi adalah?",
    options: ["Bulan", "Bintang", "Matahari", "Angin"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Zat yang menyebabkan ozon rusak adalah?",
    options: ["Oksigen", "Karbon monoksida", "CFC", "Nitrogen"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Hukum kekekalan energi ditemukan oleh?",
    options: ["Newton", "Einstein", "Joule", "Archimedes"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Penyakit akibat kekurangan yodium adalah?",
    options: ["Gondok", "Diabetes", "Hipertensi", "Anemia"],
    correctAnswerIndex: 0,
    category: "IPA",
  ),
  Question(
    questionText: "Bagian mata yang mengatur jumlah cahaya masuk adalah?",
    options: ["Retina", "Kornea", "Iris", "Lensa"],
    correctAnswerIndex: 2,
    category: "IPA",
  ),
  Question(
    questionText: "Satuan kuat arus listrik adalah?",
    options: ["Volt", "Ampere", "Watt", "Ohm"],
    correctAnswerIndex: 1,
    category: "IPA",
  ),
  Question(
    questionText: "Proses pembuatan makanan pada tumbuhan disebut?",
    options: ["Respirasi", "Fotosintesis", "Transpirasi", "Evaporasi"],
    correctAnswerIndex: 1,
    category: "IPA",
  ),

  Question(
    questionText: "Mata uang negara Jepang adalah?",
    options: ["Dollar", "Yen", "Won", "Yuan"],
    correctAnswerIndex: 1,
    category: "IPS",
  ),
  Question(
    questionText: "Benua terluas di dunia adalah?",
    options: ["Afrika", "Amerika", "Asia", "Eropa"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Ibukota negara Australia adalah?",
    options: ["Sydney", "Melbourne", "Canberra", "Perth"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Sungai terpanjang di dunia adalah?",
    options: ["Amazon", "Nil", "Mississippi", "Yangtze"],
    correctAnswerIndex: 1,
    category: "IPS",
  ),
  Question(
    questionText: "Gunung tertinggi di Indonesia adalah?",
    options: ["Semeru", "Rinjani", "Jaya Wijaya", "Kerinci"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Negara dengan populasi terbesar di dunia adalah?",
    options: ["India", "Amerika", "China", "Indonesia"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Laut yang memisahkan Indonesia dengan Malaysia adalah?",
    options: ["Laut Jawa", "Laut Cina Selatan", "Laut Sulawesi", "Laut Malaka"],
    correctAnswerIndex: 3,
    category: "IPS",
  ),
  Question(
    questionText: "Pulau terbesar di Indonesia adalah?",
    options: ["Jawa", "Sumatera", "Kalimantan", "Papua"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Mata pencaharian utama penduduk di daerah pantai adalah?",
    options: ["Berkebun", "Beternak", "Nelayan", "Pertambangan"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Badan PBB yang mengurusi pendidikan dan kebudayaan adalah?",
    options: ["WHO", "UNICEF", "UNESCO", "ILO"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Kerajaan Hindu pertama di Indonesia adalah?",
    options: ["Sriwijaya", "Majapahit", "Kutai", "Tarumanegara"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Pahlawan nasional dari Aceh adalah?",
    options: ["Diponegoro", "Cut Nyak Dien", "Sudirman", "Kartini"],
    correctAnswerIndex: 1,
    category: "IPS",
  ),
  Question(
    questionText: "Sistem ekonomi yang dianut Indonesia adalah?",
    options: ["Liberal", "Sosialis", "Pancasila", "Kapitalis"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Lembaga negara yang membuat undang-undang adalah?",
    options: ["Eksekutif", "Legislatif", "Yudikatif", "DPR"],
    correctAnswerIndex: 1,
    category: "IPS",
  ),
  Question(
    questionText: "Pajak yang dikenakan atas penghasilan disebut?",
    options: ["PPN", "PPh", "PBB", "Bea Meterai"],
    correctAnswerIndex: 1,
    category: "IPS",
  ),
  Question(
    questionText: "Organisasi perdagangan dunia adalah?",
    options: ["WTO", "WHO", "UNESCO", "IMF"],
    correctAnswerIndex: 0,
    category: "IPS",
  ),
  Question(
    questionText: "Pertukaran barang dengan barang disebut?",
    options: ["Jual beli", "Barter", "Ekspor", "Impor"],
    correctAnswerIndex: 1,
    category: "IPS",
  ),
  Question(
    questionText: "Inflasi berarti?",
    options: [
      "Turunnya harga",
      "Naiknya harga",
      "Stabilnya harga",
      "Defisit anggaran",
    ],
    correctAnswerIndex: 1,
    category: "IPS",
  ),
  Question(
    questionText: "Bank sentral Indonesia adalah?",
    options: ["BRI", "BCA", "Bank Indonesia", "BNI"],
    correctAnswerIndex: 2,
    category: "IPS",
  ),
  Question(
    questionText: "Pendiri Microsoft Corporation adalah?",
    options: ["Steve Jobs", "Bill Gates", "Mark Zuckerberg", "Elon Musk"],
    correctAnswerIndex: 1,
    category: "IPS",
  ),

  Question(
    questionText: "Kalimat yang mengandung majas metafora adalah?",
    options: [
      "Dia berlari seperti kilat",
      "Raja siang bersinar terik",
      "Suaranya menggelegar bagai halilintar",
      "Wajahnya pucat bagai mayat",
    ],
    correctAnswerIndex: 1,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kata baku dari 'apotik' adalah?",
    options: ["Apotik", "Apotek", "Appotik", "Appotek"],
    correctAnswerIndex: 1,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Sinonim dari 'bijaksana' adalah?",
    options: ["Bodoh", "Pandai", "Arif", "Ceroboh"],
    correctAnswerIndex: 2,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Antonim dari 'kaya' adalah?",
    options: ["Miskin", "Kaya raya", "Berkecukupan", "Sederhana"],
    correctAnswerIndex: 0,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kalimat yang menggunakan ejaan yang benar adalah?",
    options: [
      "Saya pergi kepasar",
      "Saya pergi ke pasar",
      "Saya pergi kepasar",
      "Saya pergi ke-pasar",
    ],
    correctAnswerIndex: 1,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Puisi yang terdiri dari 4 baris disebut?",
    options: ["Soneta", "Pantun", "Gurindam", "Syair"],
    correctAnswerIndex: 1,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kata 'telah' termasuk jenis kata?",
    options: ["Kata kerja", "Kata sifat", "Kata keterangan", "Kata depan"],
    correctAnswerIndex: 2,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Cerita rakyat yang dianggap benar-benar terjadi disebut?",
    options: ["Legenda", "Mite", "Fabel", "Sage"],
    correctAnswerIndex: 0,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Lawan kata 'mendaki' adalah?",
    options: ["Menurun", "Menaik", "Turun", "Naik"],
    correctAnswerIndex: 2,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kalimat langsung ditandai dengan penggunaan?",
    options: ["Tanda petik", "Tanda seru", "Tanda tanya", "Tanda titik"],
    correctAnswerIndex: 0,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kata yang berima dengan 'malam' adalah?",
    options: ["Pagi", "Siang", "Terang", "Kalam"],
    correctAnswerIndex: 3,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Penulisan huruf kapital yang benar terdapat pada?",
    options: [
      "presiden jokowi",
      "Presiden Jokowi",
      "presiden Jokowi",
      "Presiden jokowi",
    ],
    correctAnswerIndex: 1,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText:
        "Kalimat yang menggunakan kata serapan dari bahasa Arab adalah?",
    options: ["Masjid", "Sekolah", "Meja", "Kursi"],
    correctAnswerIndex: 0,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Tanda baca untuk kalimat tanya adalah?",
    options: ["Titik", "Koma", "Tanda tanya", "Tanda seru"],
    correctAnswerIndex: 2,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kata 'berjalan-jalan' termasuk kata?",
    options: ["Kerja", "Sifat", "Benda", "Keterangan"],
    correctAnswerIndex: 0,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Cerita pendek disebut juga?",
    options: ["Novel", "Cerpen", "Roman", "Dongeng"],
    correctAnswerIndex: 1,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kalimat yang mengandung majas personifikasi adalah?",
    options: [
      "Angin berbisik lembut",
      "Dia setinggi pohon kelapa",
      "Waktunya adalah uang",
      "Hatinya keras seperti batu",
    ],
    correctAnswerIndex: 0,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Kata 'tidak' termasuk jenis kata?",
    options: ["Kata kerja", "Kata sifat", "Kata negasi", "Kata depan"],
    correctAnswerIndex: 2,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Penulisan angka yang benar adalah?",
    options: ["10.000", "10.000,00", "10,000", "10 000"],
    correctAnswerIndex: 1,
    category: "Bahasa Indonesia",
  ),
  Question(
    questionText: "Karya sastra yang berupa dialog untuk dipentaskan disebut?",
    options: ["Puisi", "Prosa", "Drama", "Esai"],
    correctAnswerIndex: 2,
    category: "Bahasa Indonesia",
  ),

  Question(
    questionText: "What is the past tense of 'go'?",
    options: ["Goed", "Went", "Gone", "Going"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Synonym of 'happy' is?",
    options: ["Sad", "Joyful", "Angry", "Tired"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Opposite of 'beautiful' is?",
    options: ["Pretty", "Ugly", "Nice", "Lovely"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "'I ___ to school every day.' The correct verb is?",
    options: ["Go", "Goes", "Went", "Gone"],
    correctAnswerIndex: 0,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Plural form of 'child' is?",
    options: ["Childs", "Children", "Childes", "Childrens"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "What is the capital of England?",
    options: ["Paris", "London", "Berlin", "Madrid"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Which is a pronoun?",
    options: ["Run", "Beautiful", "He", "Quickly"],
    correctAnswerIndex: 2,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Past participle of 'eat' is?",
    options: ["Eated", "Ate", "Eaten", "Eating"],
    correctAnswerIndex: 2,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "'She ___ singing right now.' The correct form is?",
    options: ["Is", "Are", "Am", "Be"],
    correctAnswerIndex: 0,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Which sentence is correct?",
    options: [
      "I am go to market",
      "I goes to market",
      "I am going to market",
      "I going to market",
    ],
    correctAnswerIndex: 2,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "What does 'delicious' mean?",
    options: ["Not good", "Very tasty", "Beautiful", "Expensive"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Comparative form of 'big' is?",
    options: ["Bigger", "Biggest", "More big", "Most big"],
    correctAnswerIndex: 0,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Superlative form of 'good' is?",
    options: ["Gooder", "Goodest", "Better", "Best"],
    correctAnswerIndex: 3,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "How do you say 'terima kasih' in English?",
    options: ["Sorry", "Thank you", "Please", "Welcome"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "'They ___ students.' The correct form is?",
    options: ["Is", "Am", "Are", "Be"],
    correctAnswerIndex: 2,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Which is a preposition?",
    options: ["And", "But", "In", "Or"],
    correctAnswerIndex: 2,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "What is the meaning of 'book'?",
    options: ["Buku", "Pensil", "Meja", "Kursi"],
    correctAnswerIndex: 0,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "Opposite of 'expensive' is?",
    options: ["Cheap", "Costly", "Valuable", "Precious"],
    correctAnswerIndex: 0,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "'I have ___ apple.' The correct article is?",
    options: ["A", "An", "The", "No article"],
    correctAnswerIndex: 1,
    category: "Bahasa Inggris",
  ),
  Question(
    questionText: "What time is 'noon'?",
    options: ["Morning", "Afternoon", "Evening", "12:00 PM"],
    correctAnswerIndex: 3,
    category: "Bahasa Inggris",
  ),

  Question(
    questionText: "Singkatan dari CPU adalah?",
    options: [
      "Central Processing Unit",
      "Computer Personal Unit",
      "Central Program Unit",
      "Computer Processing Unit",
    ],
    correctAnswerIndex: 0,
    category: "TIK",
  ),
  Question(
    questionText: "Perangkat untuk mencetak dokumen disebut?",
    options: ["Scanner", "Printer", "Monitor", "Keyboard"],
    correctAnswerIndex: 1,
    category: "TIK",
  ),
  Question(
    questionText: "Software pengolah kata adalah?",
    options: ["Excel", "PowerPoint", "Word", "Photoshop"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "1 byte sama dengan?",
    options: ["4 bit", "8 bit", "16 bit", "32 bit"],
    correctAnswerIndex: 1,
    category: "TIK",
  ),
  Question(
    questionText: "Jaringan komputer yang mencakup area kecil disebut?",
    options: ["LAN", "WAN", "MAN", "INTERNET"],
    correctAnswerIndex: 0,
    category: "TIK",
  ),
  Question(
    questionText: "Browser adalah program untuk?",
    options: [
      "Mengolah data",
      "Browsing internet",
      "Membuat presentasi",
      "Mengedit gambar",
    ],
    correctAnswerIndex: 1,
    category: "TIK",
  ),
  Question(
    questionText: "Extension file gambar biasanya?",
    options: [".doc", ".xls", ".jpg", ".mp3"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "Pencipta Microsoft adalah?",
    options: ["Steve Jobs", "Bill Gates", "Mark Zuckerberg", "Larry Page"],
    correctAnswerIndex: 1,
    category: "TIK",
  ),
  Question(
    questionText: "RAM adalah memori?",
    options: ["Permanen", "Sementara", "External", "Secondary"],
    correctAnswerIndex: 1,
    category: "TIK",
  ),
  Question(
    questionText: "Shortcut untuk copy adalah?",
    options: ["Ctrl+A", "Ctrl+C", "Ctrl+V", "Ctrl+X"],
    correctAnswerIndex: 1,
    category: "TIK",
  ),
  Question(
    questionText: "Software untuk presentasi adalah?",
    options: ["Word", "Excel", "PowerPoint", "Access"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "Alat input komputer adalah?",
    options: ["Monitor", "Printer", "Keyboard", "Speaker"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "WWW singkatan dari?",
    options: [
      "World Wide Web",
      "World Web Wide",
      "Web World Wide",
      "Wide World Web",
    ],
    correctAnswerIndex: 0,
    category: "TIK",
  ),
  Question(
    questionText: "Email digunakan untuk?",
    options: [
      "Mengirim pesan",
      "Membuat dokumen",
      "Mengedit gambar",
      "Menghitung data",
    ],
    correctAnswerIndex: 0,
    category: "TIK",
  ),
  Question(
    questionText: "Harddisk termasuk perangkat?",
    options: ["Input", "Output", "Storage", "Processing"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "OS singkatan dari?",
    options: [
      "Operating System",
      "Office Software",
      "Online Service",
      "Open Source",
    ],
    correctAnswerIndex: 0,
    category: "TIK",
  ),
  Question(
    questionText: "Shortcut untuk paste adalah?",
    options: ["Ctrl+A", "Ctrl+C", "Ctrl+V", "Ctrl+X"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "Software antivirus contohnya?",
    options: ["Windows", "Linux", "Avast", "Office"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "Resolution monitor diukur dalam?",
    options: ["Hz", "Bit", "Pixel", "Byte"],
    correctAnswerIndex: 2,
    category: "TIK",
  ),
  Question(
    questionText: "PDF singkatan dari?",
    options: [
      "Portable Document Format",
      "Personal Data File",
      "Public Document Form",
      "Printable Data Format",
    ],
    correctAnswerIndex: 0,
    category: "TIK",
  ),

  Question(
    questionText: "Sumpah Pemuda dicetuskan pada tahun?",
    options: ["1908", "1928", "1945", "1950"],
    correctAnswerIndex: 1,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Pahlawan nasional dari Jawa Barat adalah?",
    options: ["Diponegoro", "Cut Nyak Dien", "Kartini", "Otto Iskandardinata"],
    correctAnswerIndex: 3,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Perang Diponegoro terjadi pada tahun?",
    options: ["1825-1830", "1873-1904", "1945-1949", "1811-1816"],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Kerajaan Islam pertama di Indonesia adalah?",
    options: ["Samudera Pasai", "Demak", "Aceh", "Mataram"],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "BPUPKI dibentuk pada tahun?",
    options: ["1942", "1943", "1944", "1945"],
    correctAnswerIndex: 3,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Penandatanganan naskah proklamasi dilakukan di?",
    options: ["Jakarta", "Bandung", "Yogyakarta", "Surabaya"],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText:
        "Pahlawan nasional yang dikenal sebagai 'Bapak Pendidikan' adalah?",
    options: ["Ki Hajar Dewantara", "Soekarno", "Hatta", "Sudirman"],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Peristiwa Bandung Lautan Api terjadi pada?",
    options: ["1945", "1946", "1947", "1948"],
    correctAnswerIndex: 1,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Konferensi Asia Afrika dilaksanakan di?",
    options: ["Jakarta", "Bandung", "Bogor", "Yogyakarta"],
    correctAnswerIndex: 1,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Pemberontakan PKI Madiun terjadi pada tahun?",
    options: ["1945", "1946", "1948", "1950"],
    correctAnswerIndex: 2,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Tokoh yang mengetik naskah proklamasi adalah?",
    options: ["Soekarno", "Hatta", "Sayuti Melik", "Ahmad Soebardjo"],
    correctAnswerIndex: 2,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Peristiwa 10 November diperingati sebagai hari?",
    options: ["Pahlawan", "Kemerdekaan", "Kartini", "Sumpah Pemuda"],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Kerajaan Majapahit mencapai puncak kejayaan pada masa?",
    options: ["Hayam Wuruk", "Raden Wijaya", "Kertanegara", "Airlangga"],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Pertempuran Ambarawa dipimpin oleh?",
    options: ["Soedirman", "Soekarno", "Hatta", "Gatot Subroto"],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Penyebab utama Perang Aceh adalah?",
    options: [
      "Ekonomi",
      "Agama",
      "Politik",
      "Penolakan terhadap penjajahan Belanda",
    ],
    correctAnswerIndex: 3,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Tokoh perempuan pejuang dari Jawa Barat adalah?",
    options: ["Kartini", "Cut Nyak Dien", "Dewi Sartika", "Martha Christina"],
    correctAnswerIndex: 2,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Perjanjian Renville ditandatangani pada tahun?",
    options: ["1945", "1947", "1948", "1949"],
    correctAnswerIndex: 2,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Pahlawan nasional dari Bali adalah?",
    options: ["Diponegoro", "I Gusti Ngurah Rai", "Sudirman", "Teuku Umar"],
    correctAnswerIndex: 1,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Pertempuran Surabaya terjadi pada?",
    options: ["Agustus 1945", "Oktober 1945", "November 1945", "Desember 1945"],
    correctAnswerIndex: 2,
    category: "Sejarah Indonesia",
  ),
  Question(
    questionText: "Tokoh proklamator Indonesia adalah?",
    options: [
      "Soekarno-Hatta",
      "Soekarno-Sudirman",
      "Hatta-Sudirman",
      "Soekarno-Syahrir",
    ],
    correctAnswerIndex: 0,
    category: "Sejarah Indonesia",
  ),
];

List<Question> getRandomQuestions(int count) {
  questions.shuffle();
  return questions.take(count).toList();
}
