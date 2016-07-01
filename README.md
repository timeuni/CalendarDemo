# CalendarDemo
一个日历可选择日期，选择显示日期范围的控件

通过 **init** 方法来设置 日历显示范围 选定的日期 和选择日期后的回调

```swift
  init(day: NSInteger, ToDateForString todate: String, block: CalendarBlock) {
```

使用示例

```swift
  choiceData: NSDate
  
  let chvc = HCDateController(day: 120, ToDateForString: self.choiceDate.stringFromDate(self.choiceDate)) { (model) in
    self.label.text = "\(model.toString("MM月dd日")) \(model.getWeek())"
    self.choiceDate = model.date()
  }
  
```

在 **CalendarLogic.swift** 中的 **changStyle** 方法 和 **LunarForSolarYea** 方法 里面可以添加特色的节日
