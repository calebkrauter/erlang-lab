interface IPerson {
  fName: string;
  lName: string;
}
interface IAgedPerson extends IPerson {
  age: number;
}

let peep: IPerson = {
  fName: "Charles",
  lName: "Bryan",
};

let agePeep: IAgedPerson = { ...peep, age: 39 };

let typedVar: string = "string";
typedVar = "7";
console.log(typedVar);

const numbers: number[] = [1, 2, 3, 4, 5, 6, 7];

function s1ts(x: number = 0): number {
  return x * x;
}

console.log(s1ts(5));

let s2ts = function (x: number): number {
  return x ** 2; //uses the raise to the power operator
};

const s3ts = (x: number): number => x ** x;

const hots = function (x: number, translate: (n: number) => number): number {
  return translate(x);
};
