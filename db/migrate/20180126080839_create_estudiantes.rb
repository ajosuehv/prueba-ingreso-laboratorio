class CreateEstudiantes < ActiveRecord::Migration[5.1]
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :ncuenta
      t.string :correo_electronico
      t.decimal :exact_sigma
      t.decimal :exact_mean
      t.decimal :real_sigma
      t.decimal :real_mean
      t.decimal :seed
      t.text :data
      t.timestamps
    end
  end
end
