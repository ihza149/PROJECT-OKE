<!-- judul -->
<div class="panel-top">
    <b class="text-green"><i class="fa fa-plus-circle text-green"></i> Tambah data</b>
</div>
<form id="form" action="./proses/prosestambah.php" method="POST">
    <input type="hidden" value="bobot" name="op">
    <div class="panel-middle">
        <div class="group-input">
            <label for="barang">Jenis Barang</label>
            <select class="form-custom" required name="barang" id="barang">
                <option selected disabled>--Pilih Jenis Barang--</option>
                <?php
                $query = "SELECT * FROM jenis_barang";
                $execute = $konek->query($query);
                if ($execute->num_rows > 0) {
                    while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                        echo "<option value=\"$data[id_jenisbarang]\">$data[namaBarang]</option>";
                    }
                } else {
                    echo "<option value=\"\">Belum ada Jenis Barang</option>";
                }
                ?>
            </select>
        </div>
        <?php
        $listketersediaan = array(
            array("nama" => "0.2 == x < = 3000", "nilai" => 0.2),
            array("nama" => "0.4 == 3000 < x < = 5000", "nilai" => 0.4),
            array("nama" => "0.6 == 5000 < x < = 10000", "nilai" => 0.6),
            array("nama" => "0.8 == 10000 < x < = 14000", "nilai" => 0.8),
            array("nama" => "1 == x > = 15000", "nilai" => 1),
        );
        $listakses = array(
            array("nama" => "0.2 == x < = 25000", "nilai" => 0.2),
            array("nama" => "0.4 == 25000 < x < = 35000", "nilai" => 0.4),
            array("nama" => "0.6 == 30000 < x < 35000", "nilai" => 0.6),
            array("nama" => "0.8 == 35000 < x < = 43000", "nilai" => 0.8),
            array("nama" => "1 == x > = 44000", "nilai" => 1),
        );
        $listpemanfaatan = array(
            array("nama" => "0.2 == x < = 3000", "nilai" => 0.2),
            array("nama" => "0.4 == 3000 < x < = 6000", "nilai" => 0.4),
            array("nama" => "0.6 == 6000 < x < = 15000", "nilai" => 0.6),
            array("nama" => "0.8 == 15000 < x < = 18000", "nilai" => 0.8),
            array("nama" => "1 == x > = 19000", "nilai" => 1),
        );
        $query = "SELECT * FROM kriteria";
        $execute = $konek->query($query);
        if ($execute->num_rows > 0) {
            while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                echo "<div class=\"group-input\">
                        <label for=\"$data[namaKriteria]\">$data[namaKriteria]/Ton</label>
                        <input type='hidden' value=$data[id_kriteria] name='kriteria[]'>
                            <select class=\"form-custom\" required name=\"bobot[]\" id=\"$data[namaKriteria]\">
                            <option selected disabled>--Pilih Bobot $data[namaKriteria]--</option>";
                if ($data['namaKriteria'] == 'Ketersediaan Pangan') {
                    foreach ($listketersediaan as $key) {
                        echo "<option value=\"$key[nilai]\">$key[nama]</option>";
                    }
                } else if ($data['namaKriteria'] == 'Akses Pangan') {
                    foreach ($listakses as $key) {
                        echo "<option value=\"$key[nilai]\">$key[nama]</option>";
                    }
                } else if ($data['namaKriteria'] == 'Pemanfaatan Pangan') {
                    foreach ($listpemanfaatan as $key) {
                        echo "<option value=\"$key[nilai]\">$key[nama]</option>";
                    }
                }

                echo "      </select>
                      </div>
                ";
            }
        }
        ?>
        <!-- <div class="group-input">
                        <label for="KetersediaanPangan">Ketersediaan Pangan</label>
                            <select class="form-custom" required name="ketersediaan" id="KetersediaanPangan">
                            <option selected disabled>--Pilih BobotKetersediaanPangan--</option>
                            <option value="x<=3000">x<=3000</option>
                            <option value="3<x<=5000">3 < x < = 5000</option>
                            <option value="5<x<=10000">5 < x < = 10000</option>
                            <option value="10<x<=14000">10 < x < = 14000</option>
                            <option value="x>=15">x>=15</option>
                            </select>
    </div>
    <div class="group-input">
                        <label for="AksesPangan">Akses Pangan</label>
                            <select class="form-custom" required name="Akses" id="AksesPangan">
                            <option selected disabled>--Pilih Bobot Akses Pangan--</option>
                            <option value="x<=3000">x<=3000</option>
                            <option value="3<x<=5000">3 < x < = 5000</option>
                            <option value="5<x<=10000">5 < x < = 10000</option>
                            <option value="10<x<=14000">10 < x < = 14000</option>
                            <option value="x>=15">x>=15</option>
                            </select>
    </div>
    <div class="group-input">
                        <label for="PemanfaatanPangan">Pemanfaatan Pangan</label>
                            <select class="form-custom" required name="Pemanfaatan" id="PemanfaatanPangan">
                            <option selected disabled>--Pilih Bobot Pemanfaatan Pangan--</option>
                            <option value="x<=3000">x<=3000</option>
                            <option value="3<x<=5000">3 < x < = 5000</option>
                            <option value="5<x<=10000">5 < x < = 10000</option>
                            <option value="10<x<=14000">10 < x < = 14000</option>
                            <option value="x>=15">x>=15</option>
                            </select>
    </div> -->
    </div>
    <div class="panel-bottom">
        <button type="submit" id="buttonsimpan" class="btn btn-green"><i class="fa fa-save"></i> Simpan</button>
        <button type="reset" id="buttonreset" class="btn btn-second">Reset</button>
    </div>
</form>