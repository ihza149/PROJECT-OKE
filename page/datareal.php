<?php
require './connect.php';
?>
<!-- judul -->
<div class="panel">
    <div class="panel-middle" id="judul">
        <img src="asset/image/bobot.svg">
        <div id="judul-text">
            <h2 class="text-green">Data Real</h2>
            Halamanan Administrator Bobot Kriteria
        </div>
    </div>
</div>
<!-- judul -->
<div class="row">
    <div class="col-4">
        <div class="panel">
            <?php
            if (@htmlspecialchars($_GET['aksi']) == 'ubah') {
                include 'ubahdatareal2.php';
            } elseif (@htmlspecialchars($_GET['aksi']) == 'lihat') {
                include 'lihatdatareal.php';
            } else {
                include 'tambahdatareal2.php';
            }
            ?>
        </div>
    </div>
    <div class="col-8">
        <div class="panel">
            <div class="panel-top">
                <b class="text-green">Daftar Data Real</b>
            </div>
            <div class="panel-middle">
                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Kecamatan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $query = "SELECT datareal.id_supplier AS idsupplier,supplier.namaSupplier AS namaSupplier FROM datareal INNER JOIN supplier WHERE datareal.id_supplier=supplier.id_supplier GROUP BY idsupplier ORDER BY idsupplier ASC";
                            $execute = $konek->query($query);
                            if ($execute->num_rows > 0) {
                                $no = 1;
                                while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                                    echo "
                                <tr id='data'>
                                    <td>$no</td>
                                    <td>$data[namaSupplier]</td>
                                    <td>
                                    <div class='norebuttom'>
                                    <a class=\"btn btn-green\" href='./?page=datareal&aksi=lihat&id=" . $data['idsupplier'] . "'><i class='fa fa-eye'></i></a>
                                    <a class=\"btn btn-light-green\" href='./?page=datareal&aksi=ubah&id=" . $data['idsupplier'] . "'><i class='fa fa-pencil-alt'></i></a>
                                    <a class=\"btn btn-yellow\" data-a=" . $data['namaSupplier'] . " id='hapus' href='./proses/proseshapus.php/?op=datareal&id=" . $data['idsupplier'] . "'><i class='fa fa-trash-alt'></i></a></td>
                                </div></tr>";
                                    $no++;
                                }
                            } else {
                                echo "<tr><td  class='text-center text-green' colspan='4'><b>Kosong</b></td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-bottom"></div>
        </div>
    </div>
</div>