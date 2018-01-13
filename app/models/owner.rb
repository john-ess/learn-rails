class Owner

  def name
    name = "Foobar Kadigan"
  end

  def birthdate
    birthdate = Date.new(2017, 3, 31)
  end

  def countdown
    today     = Date.today
    birthday  = Date.new(today.year, birthdate.month, birthdate.day )

    # if returns a result, https://github.com/bbatsov/ruby-style-guide#use-if-case-returns
    countdown =
      if birthday > today
        (birthday - today).to_i
      else
        (birthday.next_year - today).to_i
      end
  end

end
