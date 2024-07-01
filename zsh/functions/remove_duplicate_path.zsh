
# PATH에서 중복된 항목 제거
function remove_duplicate_path() {
    typeset -A path_array
    for path in ${(s/:/)PATH}; do
        path_array[$path]=1
    done
    PATH=${(j/:/)${(k)path_array}}
    export PATH
}

# 중복 제거 함수 실행
remove_duplicate_path


