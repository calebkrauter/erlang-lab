
interface IStudent {
    name: string,
    id: number
}
interface ISetStudent extends IStudent {
    major: string
}
const students: string[] = [
    "Khoi",
    "Codi",
    "Mitiku",
    "Kevin",
    "Amtoj",
    "An",
    "Fred",
    "Mey",
    "Toan",
    "Jd",
];

/*************************************************************************
 * Problem #1
 *
 * Using the original JS function syntax, write a function called genId that
 * returns a random integer between [9,000,000 and 9,999,999].
 *
 * ~ HINT: Use the underscore in your numbers instead of commas! 9_000_000
 * ~ HINT: Check out the following URL for how to generate random numbers in JS
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
 **************************************************************************/
function genId(): number {
    const minCeiled = Math.ceil(9_000_000);
    const maxFloored = Math.floor(9_999_999);
    return Math.floor(Math.random() * (maxFloored - minCeiled) + minCeiled)
}
console.dir(genId());
//9481190

/*************************************************************************
 * Problem #2
 *
 * Using the lambda function syntax, write a function that accepts a single
 * string and returns an object literal (Student Object) with the following
 * key / value pairs:
 * + name : the string argument
 * + id : call genId() to get an ID
 *
 * ~ The "function body" of the lambda function should be a single statement
 * ~ Store the lambda function in a constant called genStudentObj
 * ~ HINT: you might need () when defining the object literal here: refer to lecture.
 **************************************************************************/
const genStudentObj = (theString: string): IStudent => {
    return {
        name: theString,
        id: genId()
    }
}
console.dir(genStudentObj("Charles"));
// { name: 'Charles', id: 9140115 }

/*************************************************************************
 * Problem #3
 *
 * Write a single statement that evaluates to an array of "Student Objects" using
 * all of the values in the array students defined at the beginning of this file.
 *
 * ~ Store the results in a constant called studentObjects
 **************************************************************************/
const studentObjects: IStudent[] = students.map(genStudentObj);
// For testing:
console.dir(studentObjects);
// [
//     { name: 'Khoi', id: 9154695 },
//     { name: 'Codi', id: 9024740 },
//     { name: 'Mitiku', id: 9748505 },
//     { name: 'Kevin', id: 9798790 },
//     { name: 'Amtoj', id: 9141417 },
//     { name: 'An', id: 9055390 },
//     { name: 'Fred', id: 9426023 },
//     { name: 'Mey', id: 9893683 },
//     { name: 'Toan', id: 9926848 },
//     { name: 'Jd', id: 9335346 }
// ]

/*************************************************************************
 * Problem #4
 *
 * Write a single statement that evaluates to an array of "Student Objects" using
 * all of the values in the array studentObjects keeping only the students objects
 * whose student id is less than 9_200_000.
 *
 * ~ Store the results in a constant called originalStudents
 **************************************************************************/
const originalStudents = studentObjects.filter((E: IStudent) => E['id'] < 9_200_000)
console.dir(originalStudents);
// [
//     { name: 'Khoi', id: 9154695 },
//     { name: 'Codi', id: 9024740 },
//     { name: 'Amtoj', id: 9141417 },
//     { name: 'An', id: 9055390 }
// ]

/*************************************************************************
 * Problem #5
 *
 * Write a single statement that evaluates to the single "Student Object" with
 * the lowest ID using all of the values in the array studentObjects.
 *
 * ~ Use the ternary operator in your solution
 * ~ Store the results in a constant called firstStudent
 **************************************************************************/
const firstStudent: IStudent = studentObjects.reduce((accumulator: IStudent, currentValue: IStudent) => currentValue.id < accumulator.id ? currentValue : accumulator, studentObjects[0]);
console.dir(firstStudent);
// { name: 'Codi', id: 9024740 } 

/*************************************************************************
 * Problem #6
 *
 * Using the lambda function syntax, write a function that accepts a single
 * number and returns a string. When the number is even, return the string
 * "TCSS" and when the number is odd, return the string "TCES"
 *
 * ~ Use the ternary operator in your solution
 * ~ Store the lambda function in a constant called major
 **************************************************************************/
const major = (theNumber: number): string => theNumber % 2 === 0 ? "TCSS" : "TCES";
console.dir(major(9));
// 'TCES'

/*************************************************************************
 * Problem #7
 *
 * Write a single statement that evaluates to an array of "Student Objects" using
 * all of the values in the array studentObjects. Use the spread operator to "copy"
 * each "Student Object" while also adding a new field to the resulting "Student Object"
 * + major : 'TCSS' || 'TCES'
 *
 * ~ Use the function major() to determine the student's major based on their id
 * ~ Store the results in a constant called setStudents
 **************************************************************************/

const setStudents: ISetStudent[] = studentObjects.map((CurStudentObject: IStudent) => ({ ...CurStudentObject, major: major(CurStudentObject['id']) }));

// studentObjects.map((E) => {...E, major: major(E['id'])})
console.dir(setStudents);
// [
//     { name: 'Khoi', id: 9154695, major: 'TCES' },
//     { name: 'Codi', id: 9024740, major: 'TCSS' },
//     { name: 'Mitiku', id: 9748505, major: 'TCES' },
//     { name: 'Kevin', id: 9798790, major: 'TCSS' },
//     { name: 'Amtoj', id: 9141417, major: 'TCES' },
//     { name: 'An', id: 9055390, major: 'TCSS' },
//     { name: 'Fred', id: 9426023, major: 'TCES' },
//     { name: 'Mey', id: 9893683, major: 'TCES' },
//     { name: 'Toan', id: 9926848, major: 'TCSS' },
//     { name: 'Jd', id: 9335346, major: 'TCSS' }
// ]

/*************************************************************************
 * Problem #8
 *
 * Write a single statement that evaluates to the the total number of
 * student objects whose major is 'TCSS' in the array setStudents.
 *
 * ~ Use the ternary operator in your solution
 * ~ Store the results in a constant called countTcss
 **************************************************************************/
const countTcss: number = setStudents.reduce((accumulator: number, currentValue: ISetStudent) => currentValue.major == "TCSS" ? accumulator + 1 : accumulator, 0);
console.log(countTcss);
// 5
