class MeasurementConversionsScreen < ProMotion::GroupedTableScreen
  title "Measurement Conversions"

  def table_data
    prefix = Array.new
    liquid = Array.new
    weight = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'measurement_conversions.txt')).split("\n").each do |formula|
      measurement, conversion, type = formula.split("\t")
      prefix << {title: measurement, subtitle: conversion, cellStyle: UITableViewCellStyleValue1} if type == 'Prefix'
      liquid << {title: measurement, subtitle: conversion, cellStyle: UITableViewCellStyleValue1} if type == 'Liquid'
      weight << {title: measurement, subtitle: conversion, cellStyle: UITableViewCellStyleValue1} if type == 'Weight'
    end

    return [{ title: 'Prefixes', cells: prefix }, { title: 'Liquid Approximations', cells: liquid }, { title: 'Weight Approximations', cells: weight }]
  end

end
