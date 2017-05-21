module DatetimePickerHelper
  def strf_picker(datetime)
    t1,t2,t3 = datetime.split(/ /)[0],datetime.split(/ /)[1],datetime.split(/ /)[2]

    t1_date = t1.split(/\//).shift(2)
    t1_year = t1.split(/\//).pop
    t1 = t1_date.unshift(t1_year).join('-')
    
    t2_ary = t2.split(/:/)
    if t3 == 'PM'
      t2 = (t2_ary[0].to_i + 12).to_s + ":" + t2_ary[1]
    else
      t2 = t2_ary[0] + ":" + t2_ary[1]
    end

    t1 + "T" + t2
  end
end
