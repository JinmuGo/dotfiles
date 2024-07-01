function git_submodule_delete() {
    if [ -z "$1" ]; then
        echo "Usage: git_submodule_delete <submodule-path>"
        return 1
    fi

    submodule_path=$1

    # Convert the relative path to an absolute path
    absolute_path=$(realpath "$submodule_path")

    # Check if the submodule exists
    if [ ! -d "$absolute_path" ]; then
        echo "Error: Submodule path '$absolute_path' does not exist."
        return 1
    fi

    # Remove the submodule entry from .git/config
    git config -f .git/config --remove-section submodule."$submodule_path"

    # Remove the submodule from the index
    git rm --cached "$submodule_path"

    # Delete the submodule directory from the superproject's .git/modules directory
    rm -rf .git/modules/"$submodule_path"

    # Remove the submodule entry from .gitmodules
    git config -f .gitmodules --remove-section submodule."$submodule_path"
    sed -i "/^\[submodule \"$submodule_path\"\]/,/^$/d" .gitmodules

    # Remove the submodule directory from the working tree
    rm -rf "$absolute_path"

    # Commit the changes
    git add .gitmodules
    git commit -m "Remove submodule $submodule_path"

    echo "Submodule '$submodule_path' has been removed successfully."
}
