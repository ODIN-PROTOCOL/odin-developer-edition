When you want to use rust in order to create script and then compile it to wasm you need the following dependencies in _Cargo.toml_:
```toml
wasm-bindgen = "0.2.63"
obi = "0.0.1"
owasm = "0.1.10"
syn = "=1.0.57" <- this one is not the latest, but the latest supported in 'obi'
```