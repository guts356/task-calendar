module TasksHelper
  def label_color(status)
    if status == '完了'
      'success'
    else
      'warning'
    end
  end
  
  def datetime_to_ja(datetime)
    datetime.strftime("%Y年 %m月 %d日, %H:%M:%S")
  end
  
end
