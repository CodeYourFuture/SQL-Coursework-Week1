///
function solution(A) {
  let count = 0;
  let newArra = [];
  let r = A.filter((x) => x % 4 == 0);

  for (let i = 0; i < r.length; i++) {
    count = count + r[i];
  }
  return count;
  // Implement your solution here
}
console.log(solution([-6, -91, 1011, -100, 84, -22, 0, 1, 473]));
