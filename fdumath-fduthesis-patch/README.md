# fdumath-fduthesis-patch



- 提供 `fdumath-fduthesis-patch.sty`;
- 版本提供者: 提供便捷的接口 `fdu/FDUMathThesisEditor` 以供版本更新, 更新方法详见 `fdumath-fduthesis-patch.sty` 中的示例 `Edition 2019` 及 `Edition 2021`;
- 使用者: 在 `Edition 2019` 及 `Edition 2021` 中, 为`fduthesis` 宏包 ( 曾祥东 ) 的 `\fdusetup` 控制序列, 提供额外的接口如下
  - `fdu/info/supervisor-title` ( 职称 );
  - `fdu/info/supervisor-unit` ( 单位 );
  - `fdu/info/date/year`, `fdu/info/date/month`, `fdu/info/date/day`, 此三者能控制封面一的日期输出, 且 `fdu/info/date/year` 能控制所使用的版本;
- 效果请见 `test.tex`, `test.pdf`.
- 进一步需要修正的内容:
  - 各年度版本之封面一的距离勘测;
  - 各年度版本之封面二、封面三、封面四的导入.