!| コマンド ライン引数取得のテストです。
! 名前、年齢、体重をコマンド ライン引数で与えます。
! 標準出力にコマンド ライン引数で与えた名前、年齢、体重を表示します。
program argument_getter_test
    use, intrinsic :: iso_fortran_env
    use class_argument_getter
    implicit none

    ! 名前
    character(:), allocatable :: name
    ! 年齢
    integer(int32) age
    ! 体重
    real(real64) weight

    ! コマンド ライン引数を取得するクラス
    type(argument_getter) args_getter

    ! コマンド ライン引数を解析します。
    if(args_getter%get_size() /= 3) then
        ! エラーを通知してプログラムを終了します。
        write(error_unit, *) "ERROR: There must be following command line arguments."
        write(error_unit, *) "  - name: character"
        write(error_unit, *) "  - age: integer"
        write(error_unit, *) "  - weight (kg): real number or integer"
        write(error_unit, *) "(e.g.) argument_getter_test.exe Suzuki 3 2.5"
        write(error_unit, *) "Program ended."
        error stop
    end if
    
    ! 名前を取得します。
    name = args_getter%get(1)
    ! 年齢を取得します。
    age = args_getter%to_int32(2)
    ! 体重を取得します。
    weight = args_getter%to_real64(3)
    
    ! プログラム名、名前、年齢、体重を標準出力に表示します。
    print'(A, A)', "Name: ", name
    print'(A, I3)', "Age: ", age
    print'(A, F5.1, A)', "Weight: ", weight, " kg"

end program
