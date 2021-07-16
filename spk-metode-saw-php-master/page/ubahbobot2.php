<?php
$listketersediaan = array(
    array("nama" => "0.2 - x < = 3000", "nilai" => 0.2),
    array("nama" => "0.4 - 3000 < x < = 5000", "nilai" => 0.4),
    array("nama" => "0.6 - 5000 < x < = 10000", "nilai" => 0.6),
    array("nama" => "0.8 - 10000 < x < = 14000", "nilai" => 0.8),
    array("nama" => "1 - x > = 15000", "nilai" => 1),
);
$listakses = array(
    array("nama" => "0.2 - x < = 25000", "nilai" => 0.2),
    array("nama" => "0.4 - 25000 < x < = 35000", "nilai" => 0.4),
    array("nama" => "0.6 - 30000 < x < 35000", "nilai" => 0.6),
    array("nama" => "0.8 - 35000 < x < = 43000", "nilai" => 0.8),
    array("nama" => "1 - x > = 44000", "nilai" => 1),
);
$listpemanfaatan = array(
    array("nama" => "0.2 - x < = 3000", "nilai" => 0.2),
    array("nama" => "0.4 - 3000 < x < = 6000", "nilai" => 0.4),
    array("nama" => "0.6 - 6000 < x < = 15000", "nilai" => 0.6),
    array("nama" => "0.8 - 15000 < x < = 18000", "nilai" => 0.8),
    array("nama" => "1 - x > = 19000", "nilai" => 1),
);
$id = htmlspecialchars(@$_GET['id']);
$querylihat = "SELECT id_jenisbarang,bobot,id_bobotkriteria,kriteria.namaKriteria AS namaKriteria FROM bobot_kriteria INNER JOIN kriteria USING(id_kriteria) WHERE id_jenisbarang='$id'";
$execute2 = $konek->query($querylihat);
if ($execute2->num_rows == 0) {
    header('location:./?page=bobot');
}
?>
<!-- judul -->
<div class="panel-top panel-top-edit">
    <b><i class="fa fa-pencil-alt"></i> Ubah data</b>
</div>
<form id="form" action="./proses/prosesubah.php" method="POST">
    <input type="hidden" value="bobot" name="op">
    <div class="panel-middle">
        <div class="group-input">
            <div class="group-input">
                <?php
                $query = "SELECT namaBarang FROM jenis_barang WHERE id_jenisbarang='$id'";
                $execute = $konek->query($query);
                $data = $execute->fetch_array(MYSQLI_ASSOC);
                ?>
                <div class="group-input">
                    <label for="jenisbarang">Jenis Barang</label>
                    <input class="form-custom" value="<?php echo $data['namaBarang']; ?>" disabled type="text" autocomplete="off" required name="barang" id="barang">
                </div>
            </div>
        </div>
        <?php
        $execute2 = $konek->query($querylihat);
        while ($data = $execute2->fetch_array(MYSQLI_ASSOC)) {
            echo "<div class=\"group-input\">
                    <label for=\"$data[namaKriteria]\">$data[namaKriteria]</label>
                    <input type='hidden' value=\"$data[id_bobotkriteria]\" name=\"id[]\">
                    <select class=\"form-custom\" required name=\"bobot[]\" id=\"$data[namaKriteria]\">
                    <option selected disabled>--Pilih Bobot $data[namaKriteria]--</option>";
            if ($data['namaKriteria'] == 'Ketersediaan Pangan') {
                foreach ($listketersediaan as $key) {
                    if ($key['nilai'] == $data['bobot']) {
                        $selected = "selected";
                    } else {
                        $selected = null;
                    }
                    echo "<option $selected value=\"$key[nilai]\">$key[nama]</option>";
                }
            } else if ($data['namaKriteria'] == 'Akses Pangan') {
                foreach ($listakses as $key) {
                    if ($key['nilai'] == $data['bobot']) {
                        $selected = "selected";
                    } else {
                        $selected = null;
                    }
                    echo "<option $selected value=\"$key[nilai]\">$key[nama]</option>";
                }
            } else if ($data['namaKriteria'] == 'Pemanfaatan Pangan') {
                foreach ($listpemanfaatan as $key) {
                    if ($key['nilai'] == $data['bobot']) {
                        $selected = "selected";
                    } else {
                        $selected = null;
                    }
                    echo "<option $selected value=\"$key[nilai]\">$key[nama]</option>";
                }
            }
            echo "</select>
            </div>
                ";
        }
        ?>
    </div>
    <div class="panel-bottom">
        <button type="submit" id="buttonsimpan" class="btn btn-green"><i class="fa fa-save"></i> Simpan</button>
        <button type="reset" id="buttonreset" class="btn btn-second">Reset</button>
    </div>
</form>