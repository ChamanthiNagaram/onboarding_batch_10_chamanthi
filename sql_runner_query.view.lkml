
view: sql_runner_query {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'orders.created_month'
      
      
      SELECT
          (DATE_FORMAT(orders.created_at ,'%Y-%m')) AS `orders.created_month`,
          COUNT(*) AS `orders.count`
      FROM demo_db.orders  AS orders
      GROUP BY
          1
      ORDER BY
          1 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_created_month {
    type: string
    sql: ${TABLE}.`orders.created_month` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [
        orders_created_month,
	orders_count
    ]
  }
}
