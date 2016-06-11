class PhotoReportDecorator < Draper::Decorator
  delegate_all

     def created
         object.created_at.strftime("%a %m/%d/%y")

     end

end
