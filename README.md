### Rifat Fauzan / 2206082184

## Tugas 8

<details>
<summary><b>Details 📃</b></summary>

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
1. **Navigator.push()**
    - **Pengertian:** Metode `Navigator.push()` digunakan untuk menambahkan `Route` baru ke tumpukan navigator, yang memungkinkan pengguna untuk kembali ke `Route` sebelumnya melalui tombol back atau gestur kembali.
    - **Contoh:** Aplikasi yang memiliki daftar produk, ketika ingin melihat detail dari sebuah produk. Dapat akan menggunakan Navigator.push() untuk menavigasi ke halaman detail produk
    
2. **Navigator.pushReplacement()**
    - **Pengertian:** Metode `Navigator.pushReplacement()` digunakan untuk menggantikan `Route` saat ini dengan `Route` baru pada tumpukan navigator. Ini berguna ketika Anda tidak ingin pengguna kembali ke `Route` sebelumnya.
    - **Contoh:** Sebuah kasus penggunaan yang umum adalah dalam proses login atau logout. Setelah pengguna berhasil login, Anda mungkin tidak ingin mereka kembali ke halaman login lagi dengan menekan tombol back

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. **Container:** Digunakan untuk mendekorasi child widget-nya dengan warna, border, margin, dan padding. Juga dapat digunakan untuk transformasi geometrik.
2. **Column & Row:** Digunakan untuk layout dalam bentuk vertikal (Column) atau horizontal (Row). Baik Column maupun Row dapat memiliki beberapa child widgets.
3. **Stack:** Memungkinkan widget untuk ditumpuk di atas satu sama lain. Berguna untuk posisi widget di atas widget lainnya, seperti latar belakang dengan teks di atasnya.
4. **Wrap:** Mirip dengan Row atau Column tetapi bisa otomatis beralih ke baris atau kolom berikutnya jika tidak ada ruang.
5. **Padding:** Memberikan padding pada child widget-nya, yaitu memberikan spasi tambahan di sekitar widget.
6. **Align & Center:** Digunakan untuk menentukan posisi widget-nya dalam parent widget. Center akan menengahkan child di dalamnya.
7. **Expanded & Flexible:** Memberi child widget fleksibilitas dalam hal ukuran, dengan mengisi ruang yang tersedia atau menyesuaikan ukurannya sesuai dengan faktor flex.
8. **ListView:** Digunakan untuk membuat daftar scrollable yang dapat menampung banyak children.
9. **GridView:** Layout dalam bentuk grid yang scrollable, berguna untuk menampilkan banyak data dalam bentuk grid.
10. **ConstrainedBox & SizedBox:** Digunakan untuk membatasi ukuran widget child, bisa secara spesifik atau dengan batasan tertentu.
11. **AspectRatio:** Memaksa child widget-nya untuk memiliki aspek rasio tertentu.
12. **FractionallySizedBox:** Mengatur ukuran widget child-nya menjadi persentase tertentu dari ukuran parent widget-nya.
13. **Table:** Menata widgets dalam format tabel dengan baris dan kolom yang tetap.
14. **Flow:** Memberikan kontrol penataan yang lebih kompleks, bisa membuat layout yang tidak bisa dibuat dengan Row atau Column.
15. **RichText:** Memungkinkan kombinasi teks dengan gaya yang berbeda-beda di dalam satu paragraf.

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. **TextFormField untuk Nama Item:**
    Alasan Penggunaan: Input ini digunakan untuk mengumpulkan nama item yang akan ditambahkan. Ini merupakan informasi dasar yang diperlukan untuk setiap item dalam toko.
2. **TextFormField untuk Amount:**
    Alasan Penggunaan: Input ini dirancang untuk mengumpulkan jumlah atau kuantitas item. Menggunakan input teks yang dikonversi ke integer memungkinkan validasi input untuk memastikan bahwa pengguna memasukkan nilai numerik.
3. **TextFormField untuk Deskripsi:**
    Alasan Penggunaan: Input ini digunakan untuk mendapatkan deskripsi tambahan tentang item. Deskripsi ini dapat berisi informasi yang lebih detail yang tidak tertangkap hanya dengan nama item, seperti ukuran, warna, atau fitur spesifik lainnya.

### Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapan clean architecture pada aplikasi Flutter bertujuan untuk memisahkan kode menjadi lapisan-lapisan yang tidak tergantung secara langsung satu sama lain, sehingga memudahkan dalam pengujian, pemeliharaan, dan skalabilitas aplikasi. Berikut ini adalah lapisan-lapisan umum dalam clean architecture yang bisa diaplikasikan pada Flutter:
1. **Presentation Layer:** Menyimpan semua kode yang berhubungan dengan UI
2. **Domain Layer:** Lapisan inti yang menentukan bisnis logika aplikasi
3. **Data Layer:** Mengimplementasikan `Repository Interfaces` yang didefinisikan di domain layer
4. **Infrastructure Layer (opsional):** Ekstensi dari data layer

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)\
1. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
    - Buat file `shoplist_form.dart` pada direktori `lib`
    ```
    import 'package:flutter/material.dart';
    import 'package:stock_els/widgets/left_drawer.dart';

    class ShopFormPage extends StatefulWidget {
        const ShopFormPage({super.key});

        @override
        State<ShopFormPage> createState() => _ShopFormPageState();
    }

    class _ShopFormPageState extends State<ShopFormPage> {
        @override
        Widget build(BuildContext context) {
            return Placeholder();
        }
    }
    ```
2. Memakai minimal tiga elemen input, yaitu `name`, `amount`, `description`. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
    - Edit class `_ShopFormPageState` di file `shoplist_form.dart`
    ```
    class _ShopFormPageState extends State<ShopFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _price = 0;
        int _size = 0;
        int _amount = 0;
        String _description = "";
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: const Center(
                    child: Text(
                        'Form Tambah Item',
                    ),
                    ),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                ),
                drawer: const LeftDrawer(),
                body: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Nama Item",
                                        labelText: "Nama Item",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                            _name = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Nama tidak boleh kosong!";
                                        }
                                        return null;
                                    },
                                ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Harga",
                                            labelText: "Harga",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        onChanged: (String? value) {
                                            setState(() {
                                                _price = int.parse(value!);
                                            });
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return "Harga tidak boleh kosong!";
                                            }
                                            if (int.tryParse(value) == null) {
                                                return "Harga harus berupa angka!";
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Ukuran",
                                            labelText: "Ukuran",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        onChanged: (String? value) {
                                            setState(() {
                                                _size = int.parse(value!);
                                            });
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return "Ukuran tidak boleh kosong!";
                                            }
                                            if (int.tryParse(value) == null) {
                                                return "Ukuran harus berupa angka!";
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Jumlah",
                                            labelText: "Jumlah",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        onChanged: (String? value) {
                                            setState(() {
                                                _amount = int.parse(value!);
                                            });
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return "Jumlah tidak boleh kosong!";
                                            }
                                            if (int.tryParse(value) == null) {
                                                return "Jumlah harus berupa angka!";
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Deskripsi",
                                            labelText: "Deskripsi",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        onChanged: (String? value) {
                                            setState(() {
                                                _description = value!;
                                            });
                                        },
                                    ),
                                ),
                            ]
                        )
                    ),
                ),
            );
        }
    }
    ```
3. Memiliki sebuah tombol `Save`
    - Edit bagian `return Scaffold(...)` pada file `shoplist_form.dart`
    ```
    Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[900]),
                ),
                onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                        return AlertDialog(
                            title: const Text('Item berhasil tersimpan!'),
                            content: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                Text('Nama: $_name'),
                                Text('Harga: $_price'),
                                Text('Ukuran: $_size'),
                                Text('Jumlah: $_amount'),
                                Text('Deskripsi: $_description'),
                                // TODO: Munculkan value-value lainnya
                                ],
                            ),
                            ),
                            actions: [
                            TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                Navigator.pop(context);
                                },
                            ),
                            ],
                        );
                        },
                    );
                    _formKey.currentState!.reset();
                    }
                },
                child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                ),
            ),
        ),
    ),
    ```
4. Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
    - Setiap elemen input tidak boleh kosong.
        ```
        validator: (String? value) {
            if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
            }
            return null;
        },
        ```
    - Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
        ```
        validator: (String? value) {
            if (value == null || value.isEmpty) {
                return "Amount tidak boleh kosong!";
            }
            if (int.tryParse(value) == null) {
                return "Amount harus berupa angka!";
            }
            return null;
        },
        ```
5. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
    - Tambah drawer di `main.dart`
    ```
    import 'package:stock_els/widgets/left_drawer.dart';
    ...
    drawer: const LeftDrawer(),
    ...
    ```
    - Tambahkan navigator di `shop_card.dart`
    ```
    if (item.name == "Tambah Item") {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopFormPage()),
        );
    }
    ```
6. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
    - Edit class `_ShopFormPageState` di `shoplist_form.dart`
    ```
    onPressed: () {
        if (_formKey.currentState!.validate()) {
        showDialog(
            context: context,
            builder: (context) {
                return AlertDialog(
                    title: const Text('Item berhasil tersimpan'),
                    content: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                            Text('Nama: $_name'),
                            Text('Amount: $_amount'),
                            Text('Deskripsi: $_description'),
                            ],
                        ),
                    ),
                    actions: [
                        TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                            Navigator.pop(context);
                            },
                        ),
                    ],
                );
            },
        )}
    }
    ```
7. Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
    - Drawer minimal memiliki dua buah opsi, yaitu `Halaman Utama` dan `Tambah Item`.
        Edit class `LeftDrawer` di `left_drawer.dart`
        ```
        ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: (),
        ),
        ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            onTap: (),
        ),
        ```
    - Ketika memiih opsi `Halaman Utama`, maka aplikasi akan mengarahkan pengguna ke halaman utama.
        Edit class `LeftDrawer` di `left_drawer.dart`
        ```
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                ));
        },
        ```
    - Ketika memiih opsi (`Tambah Item`), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
        Edit class `LeftDrawer` di `left_drawer.dart`
        ```
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                ));
        },
        ```

</details>

## Tugas 7

<details>
<summary><b>Details 📃</b></summary>

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
1. **StatelessWidget**
    - Tidak Berubah: Sebuah StatelessWidget tidak dapat mengubah statenya selama masa hidupnya. Ini berarti bahwa setelah widget dibuat, nilai-nilai dan konfigurasinya tetap sama.
    - Sederhana dan Cepat: Karena tidak ada manajemen state, pembuatan ulang widget (rebuilding) berlangsung dengan sangat cepat.
    - Contoh Penggunaan: Cocok untuk bagian UI yang sederhana dan tidak berubah, seperti ikon, teks, dan gambar yang statis.
2. **StatefulWidget**
    - Dinamis: Sebuah StatefulWidget mampu mengubah statenya sepanjang masa hidupnya. Ini berarti bahwa widget dapat memperbarui UI berdasarkan interaksi pengguna atau data eksternal.
    - Lebih Kompleks: Dibandingkan dengan StatelessWidget, StatefulWidget memerlukan manajemen state yang lebih kompleks. Ini mempengaruhi performa terutama jika banyak pembaruan state terjadi.
    - Pemeliharaan State: StatefulWidgets memiliki objek state terpisah yang menyimpan state. Objek state ini bertahan meski terjadi hot reload dan pembuatan ulang widget.
    - Contoh Penggunaan: Cocok untuk bagian UI yang memerlukan interaksi pengguna atau pembaruan data, seperti formulir, animasi, atau timer.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. **MyHomePage:** Kelas ini merepresentasikan halaman utama aplikasi Anda. Ia mengextends StatelessWidget, yang berarti ia tidak mempertahankan state apapun antar pemanggilan build.
2. **Scaffold:** Widget yang menyediakan struktur dasar tampilan visual untuk aplikasi, termasuk AppBar, body, dan floatingActionButton.
3. **AppBar:** Sebuah Material Design app bar. Biasanya digunakan untuk menampilkan judul aplikasi, branding, atau navigasi.
4. **Text:** Widget yang menampilkan serangkaian karakter dengan gaya yang dapat disesuaikan.
5. **SingleChildScrollView:** Sebuah box yang dapat scroll, yang cocok untuk box tunggal yang akan memiliki beberapa anak tetapi tidak semua anak terlihat sekaligus.
6. **Padding:** Widget yang memberikan padding pada widget anaknya.
7. **Column:** Sebuah box yang menampilkan anak-anaknya dalam urutan vertikal.
8. **GridView:** Sebuah scrollable grid yang menampilkan widget sebagai tiles.
9. **ShopCard:** Kelas widget buatan sendiri yang menerima objek ShopItem dan menampilkan informasinya dalam bentuk card.
10. **Material:** Sebuah widget yang memberikan tampilan berdasarkan Material Design.
11. **InkWell:** Sebuah rectangle area yang dapat diklik dan memberikan efek visual saat ditekan.
12. **Container:** Sebuah box yang mengandung widget lain dan dapat diatur untuk memberikan padding, margin, ukuran, dan lain-lain.
13. **Icon:** Widget yang menampilkan sebuah ikon Material Design.
14. **Center:** Sebuah widget yang menengahkan widget anaknya.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. **Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.**
    - Jalankan *command* `flutter create shs_store` untuk *generate* proyek Flutter
    - Masuk ke dalam direktori proyek tersebut dengan *command* `cd shs_store`
2. **Membuat tiga tombol sederhana dengan ikon dan teks**
    - Pada `main.dart`hapus `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`
    - Pada `menu.dart`:
    - Tambahkan teks dan card dengan menambahkan barang-barang yang dijual. Define tipe pada list seperti berikut:
        ```
        class ShopItem {
            final String name;
            final IconData icon;

            ShopItem(this.name, this.icon);
        }
        ```
    - Ubah sifat widget halaman dari stateful menjadi stateless. Lakukan perubahan pada bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`. Selain itu, tambahkan barang-barang yang dijual (nama, harga, dan icon barang tersebut) dengan code berikut:
        ```
        final List<ShopItem> items = [
            ShopItem("Lihat Item", Icons.checklist),
            ShopItem("Tambah Item", Icons.add_shopping_cart),
            ShopItem("Logout", Icons.logout),
        ];
        ```
    - Lalu ubah method @override `Widget build(BuildContext context)` hingga menjadi seperti ini:
        ```
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: const Text(
                    'SHS store',
                    style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.indigo,
                    elevation: 5,
                    shadowColor: Colors.black,
                ),
                body: SingleChildScrollView(
                    // Widget wrapper yang dapat discroll
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            children: <Widget>[
                                const Padding(
                                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                    child: Text(
                                        'SHS Store',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                ),
                                // Grid layout
                                GridView.count(
                                    // Container pada card kita.
                                    primary: true,
                                    padding: const EdgeInsets.all(20),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 3,
                                    shrinkWrap: true,
                                    children: items.map((ShopItem item) {
                                        // Iterasi untuk setiap item
                                        return ShopCard(item);
                                    }).toList(),
                                ),
                            ],
                        ),
                    ),
                ),
            );
        }
        ```
    - Tampilkan card dengan membuat widget stateless baru:
        ```
        class ShopCard extends StatelessWidget {
            final ShopItem item;

            const ShopCard(this.item, {super.key}); // Constructor

            @override
            Widget build(BuildContext context) {
                return Material(
                color: Colors.indigo,
                child: InkWell(
                    child: Container(
                    // Container untuk menyimpan Icon dan Text
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Icon(
                            item.icon,
                            color: Colors.white,
                            size: 30.0,
                            ),
                            const Padding(padding: EdgeInsets.all(3)),
                            Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            ),
                        ],
                        ),
                    ),
                    ),
                ),
                );
            }
            }
        ```
2. **Memunculkan Snackbar**
    - Di `menu.dart` pada `class ShopCard extends StatelessWidget` tambahkan pada method override hingga menjadi seperti di bawah ini:
    ```
    @override
    Widget build(BuildContext context){
        return Material(
            ....
            child: InkWell(
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                ....
            )
        )
    }
               
    ```
4. Bonus
    - Buat parameter baru
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.lightBlue),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.lightGreen),
        ShopItem("Logout", Icons.logout, Colors.redAccent),
    ];
    ```
    ```
    class ShopItem {
        final String name;
        final IconData icon;
        final Color color; // Menambahkan field baru untuk warna

        ShopItem(this.name, this.icon, this.color);
    }
    ```
    - Tambahkan warna yang diinginkan pada class `ShopCard`
    ```
    class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: item.color, // Menggunakan warna dari item
            // (Sisa kode yang sama seperti sebelumnya)
            );
        }
    }
    ```
</details>