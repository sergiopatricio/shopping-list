# frozen_string_literal: true

require 'csv'

class UserItemsCsv
  def export(user_id)
    CSV.generate(force_quotes: true, col_sep: ';') do |csv|
      csv << %w[
        group_name
        group_position
        item_name
        item_url
        item_position
        item_total
        item_temporary
        item_confirmed
      ]

      Group.where(user_id: user_id).includes(:items).order(:position).each do |group|
        group.items.each do |item|
          csv << [
            group.name,
            group.position,
            item.name,
            item.url,
            item.position,
            item.total,
            item.temporary,
            item.confirmed
          ]
        end
      end
    end
  end

  # This assumes the user doesn't have any data
  def import(user_id, file_path)
    group_by_name = {}

    CSV.foreach(file_path, headers: true, quote_char: '"', col_sep: ';') do |row|
      group_name = row['group_name']
      group = (
        group_by_name[group_name] ||= Group.create!(user_id: user_id, name: group_name, position: row['group_position'])
      )

      Item.create!(
        user_id: user_id,
        group: group,
        name: row['item_name'],
        url: row['item_url'],
        position: row['item_position'],
        total: row['item_total'],
        temporary: row['item_temporary'],
        confirmed: row['item_confirmed']
      )
    end

    true
  end
end
