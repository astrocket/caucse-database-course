class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  def excelslicer(exceldata)
    rows = exceldata.split("\n")
    datas = []
    rows.length.times do |y|
      cells = rows[y].split("\t")
      datas[y] = []
      cells.length.times do |x|
        if x == cells.length - 1
          cells[x] = cells[x].split("\r")[0]
        end
        datas[y][x] = cells[x]
      end
    end
    return datas
  end
  
  
end
