# fdumath-fduthesis-patch (数学学院对曾祥东之fduthesis的补丁)

- 提供 `fdmthesis20XX.cls`;
- 版本提供者: 提供便捷的接口 `fdu/FDUMathThesisEditor` 以供版本更新, 更新方法详见 `fdmthesis20XX.cls` 中的示例 `Edition 2019`;
- 使用者: 在 `Edition 2019` 中, 为`fduthesis` 宏包 ( 曾祥东 ) 的 `\fdusetup` 控制序列, 提供额外的接口如下
  - `fdu/info/supervisor-title` ( 职称 );
  - `fdu/info/supervisor-unit` ( 单位 );
  - `fdu/info/date/year`, `fdu/info/date/month`, `fdu/info/date/day`, 此三者能控制封面一的日期输出, 且 `fdu/info/date/year` 能控制所使用的版本;
- 效果请见 `test.tex` 及对应的`.pdf`文件。
