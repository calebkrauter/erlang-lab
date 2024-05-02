function mergeSort(arr, comp) {
    if (arr.length <= 1) {
        return arr;
    }
    let mid = Math.floor(arr.length / 2);
    let left = mergeSort(arr.slice(0, mid), comp);
    let right = mergeSort(arr.slice(mid, arr.length), comp);

    return merge(left, right, comp);
}

const comp = (A, B) => A >= B;

function merge(left, right, comp) {
    let sortedArray = [];
    while (left.length > 0 && right.length > 0) {
        if (comp(left[0], right[0])) {
            sortedArray.push(left.shift());
        } else {
            sortedArray.push(right.shift());
        }
    }

    if (left.length == 0) {
        sortedArray = sortedArray.concat(right);
    }
    if (right.length == 0) {
        sortedArray = sortedArray.concat(left);
    }
    return sortedArray;
}

//console.log(mergeSort([-1, 999, 1, 2, 3, 2, 3, 12, 3, 4, 6, 9, 3, 2, 1], (A, B) => { return A >= B; }));