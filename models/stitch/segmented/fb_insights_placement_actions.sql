with platform_device as (

  select * from {{ref('fb_ads_insights_pd_actions')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'placement' as segment_type,
  placement as segment,
  sum(num_actions) as num_actions
from
  platform_device
group by 1, 2, 3, 4, 5, 6, 7
