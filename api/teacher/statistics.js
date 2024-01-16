const express = require("express");
const router = express.Router();
const mysql = require("../mysql");

function key(val) {
  let value;
  switch (val) {
    case "程序设计基础":
      value = "prog_fund";
      break;
    case "离散数学":
      value = "disc_math";
      break;
    case "高级程序设计":
      value = "adv_prog";
      break;
    case "数据结构":
      value = "data_struct";
      break;
    case "计算机组成原理":
      value = "comp_princ";
      break;
    case "数据库原理":
      value = "db_princ";
      break;
  }
  return value;
}
function generateRandomNumber() {
  return parseFloat((Math.random() * 9 + 1).toFixed(2));
}
router.get("/statistics/:teacher_id", async (req, res) => {
  let id = req.params.teacher_id;
  mysql.query(`select subject from teacher where id="${id}"`, function (err, result) {
    let subject = result[0].subject;
    mysql.query(`select ${key(subject)} from achievement`, function (err, _result) {
      res.json({
        data: _result.reduce((total, item) => {
          if (item[key(subject)]) {
            let _total = total;
            _total.push([generateRandomNumber(), +item[key(subject)]]);
            return _total;
          } else {
            return total;
          }
        }, []),
      });
    });
  });
});
module.exports = router;
