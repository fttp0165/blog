module PostsHelper
  def slice_range str
    new_str=str.clone
    s_start=Regexp.new("<img src=")
    s_end=Regexp.new(">")
    if (str=~s_start)
      s_start= (str =~ s_start).to_i
      str=$'
      s_end=(str=~s_end).to_i
      str=new_str[(s_start+10)..(s_end+s_start+8)]
      return image_tag str,resize_to_limit:[100,100]
    end
    return
  end
end
