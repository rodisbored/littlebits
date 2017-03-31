class CreateBitsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bits do |t|
      t.string :uuid, null: false, length: 36
      t.string :oid, null: false
      t.timestamps
    end

    add_index :bits, :uuid
    # add_index :bits, :oid

    if table_exists?(:bits)
      # Should be in a seeds file, but a bit overkill to seed only this
      bits = %w[bargraph bend-sensor branch bright-led button buzzer coin-battery dc-motor dimmer doubleand doubleor fan forkinverter led light-sensor light-trigger light-wire long-led motion-trigger power pressure-sensor pulse rgb-led roller-switch servo-motor slide-dimmer slide-switch sound-trigger temperature-sensor timeout toggle-switch usb-power uv-led vibration-motor wire]
      bits.each do |bit|
        Bit.create(oid: bit)
      end
    end
  end
end
