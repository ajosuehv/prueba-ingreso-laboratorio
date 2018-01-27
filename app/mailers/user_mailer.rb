class UserMailer < ActionMailer::Base
  default :from => 'ajosuehv@ciencias.unam.mx'

  def email(estudiante)
    @estudiante = estudiante
    csv_file = @estudiante.nombre + '.csv'
    attachments[csv_file] = {mime_type: 'text/csv', content: @estudiante.to_csv}
    mail(to: @estudiante.correo_electronico,
         subject: 'Datos para la prueba')
  end
end
