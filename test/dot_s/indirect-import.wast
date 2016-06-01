(module
  (memory 1)
  (export "memory" memory)
  (type $FUNCSIG$fd (func (param f64) (result f32)))
  (type $FUNCSIG$ijidf (func (param i64 i32 f64 f32) (result i32)))
  (type $FUNCSIG$v (func))
  (type $FUNCSIG$vj (func (param i64)))
  (import $extern_fd "env" "extern_fd" (param f64) (result f32))
  (import $extern_ijidf "env" "extern_ijidf" (param i64 i32 f64 f32) (result i32))
  (import $extern_v "env" "extern_v")
  (import $extern_vj "env" "extern_vj" (param i64))
  (export "bar" $bar)
  (export "dynCall_fd" $dynCall_fd)
  (export "dynCall_vj" $dynCall_vj)
  (export "dynCall_v" $dynCall_v)
  (export "dynCall_ijidf" $dynCall_ijidf)
  (table $__importThunk_extern_fd $__importThunk_extern_vj $__importThunk_extern_v $__importThunk_extern_ijidf)
  (func $bar (result i32)
    (local $0 i32)
    (local $1 i32)
    (i32.store offset=12
      (set_local $0
        (i32.store offset=4
          (i32.const 0)
          (i32.sub
            (i32.load offset=4
              (i32.const 0)
            )
            (i32.const 16)
          )
        )
      )
      (i32.const 0)
    )
    (call_import $extern_fd
      (f64.const 0)
    )
    (call_import $extern_fd
      (f64.const 1)
    )
    (i32.store offset=8
      (get_local $0)
      (i32.const 1)
    )
    (call_import $extern_vj
      (i64.const 1)
    )
    (i32.store offset=4
      (get_local $0)
      (i32.const 2)
    )
    (call_import $extern_v)
    (i32.store
      (get_local $0)
      (i32.const 3)
    )
    (call_import $extern_ijidf
      (i64.const 1)
      (i32.const 2)
      (f64.const 3)
      (f32.const 4)
    )
    (set_local $1
      (i32.load offset=12
        (get_local $0)
      )
    )
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $0)
        (i32.const 16)
      )
    )
    (get_local $1)
  )
  (func $__importThunk_extern_fd (type $FUNCSIG$fd) (param $0 f64) (result f32)
    (call_import $extern_fd
      (get_local $0)
    )
  )
  (func $__importThunk_extern_vj (type $FUNCSIG$vj) (param $0 i64)
    (call_import $extern_vj
      (get_local $0)
    )
  )
  (func $__importThunk_extern_v (type $FUNCSIG$v)
    (call_import $extern_v)
  )
  (func $__importThunk_extern_ijidf (type $FUNCSIG$ijidf) (param $0 i64) (param $1 i32) (param $2 f64) (param $3 f32) (result i32)
    (call_import $extern_ijidf
      (get_local $0)
      (get_local $1)
      (get_local $2)
      (get_local $3)
    )
  )
  (func $dynCall_fd (param $fptr i32) (param $0 f64) (result f32)
    (call_indirect $FUNCSIG$fd
      (get_local $fptr)
      (get_local $0)
    )
  )
  (func $dynCall_vj (param $fptr i32) (param $0 i64)
    (call_indirect $FUNCSIG$vj
      (get_local $fptr)
      (get_local $0)
    )
  )
  (func $dynCall_v (param $fptr i32)
    (call_indirect $FUNCSIG$v
      (get_local $fptr)
    )
  )
  (func $dynCall_ijidf (param $fptr i32) (param $0 i64) (param $1 i32) (param $2 f64) (param $3 f32) (result i32)
    (call_indirect $FUNCSIG$ijidf
      (get_local $fptr)
      (get_local $0)
      (get_local $1)
      (get_local $2)
      (get_local $3)
    )
  )
)
;; METADATA: { "asmConsts": {},"staticBump": 12, "initializers": [] }
