update provision.service_info
set band_with_unit = CASE band_with_unit 
                     WHEN 'Kb' then 'Mb'
                     END
WHERE band_with_unit = 'Kb';