newArrayThatIsSorted = [];
function mergeSort(arr, comp) {
    if (arr.length <= 1) {
        return arr;
    }
    mid = arr.length / 2
    left = mergeSort(arr.slice(0, mid), comp)
    right = mergeSort(arr.slice(mid + 1, arr.length - 1), comp)
    newArrayThatIsSorted = [...newArrayThatIsSorted, merge(left, right, comp)]
    return newArrayThatIsSorted;
}

const comp = (A, B) => A <= B;

function merge(left, right, comp) {
    while (left.length > 0 && right.length > 0) {
        if (comp(left[0][], right[0])) {

        }
    }
    return comp(left, right)
}

console.log(mergeSort([9, 8, 7, 6, 5, 4, 3, 2, 1], comp))