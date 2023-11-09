use rustc_version::Version;

fn main() {
    if Version::parse("1.78.0").unwrap() <= rustc_version::version().unwrap() {
        println!("cargo:rustc-cfg=compiler_has_send_sgx_types");
    }
}
