<section class="login">
    <img src="<?= base_url('assets/img/bunderBawah.png') ?>" alt="" class="bunder_bawah">
    <div class="container-fluid">
        <img src="<?= base_url('assets/img/bunderBawahKanan.png') ?>" alt="" class="bunder_bawah_kanan">
        <img src="<?= base_url('assets/img/bunderKananAtas.png') ?>" alt="" class="bunder_kanan_atas">
        <img src="<?= base_url('assets/img/bunderKiriAtas.png') ?>" alt="" class="bunder_kiri_atas">
        <div class="row justify-content-center compAuth">
            <div class="listBtnAuth">
                <a href="" class="btn btn-success btnAuthHref">Sign Up</a>
                <a href="" class="btn btn-outline-success btnAuthHref">Login</a>
            </div>
            <div class="col-5 justify-content-center">
                <form action="">
                    <div class="inlineLogin d-inline-flex">
                        <input type="text" class="form-control inputLoginSet" name="firstName" placeholder="FIRST NAME" aria-label="First name">
                        <input type="text" class="form-control inputLoginSet" name="lastName" placeholder="LAST NAME" aria-label="Last name">
                    </div>
                    <input type="text" class="form-control inputLogin" placeholder="PHONE NUMBER" name="noHp" aria-label="PHONE NUMBER">
                    <input type="text" class="form-control inputLogin" placeholder="EMAIL ADDRESS" name="email" aria-label="First name">
                    <input type="text" class="form-control inputLogin" placeholder="SET A PASSWORD" name="password" aria-label="First name">
                    <button class="btn btn-success btnSubmitLogin">Get Started</button>
                </form>
            </div>
        </div>
    </div>
</section>