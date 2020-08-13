package com.promore.workcal.dao;

import java.util.List;

import com.promore.workcal.dto.WorkcalDto;

public interface WorkcalDao {
	public List<WorkcalDto> getGiveSche(WorkcalDto workcalDto);
	public List<WorkcalDto> getTakeSche(WorkcalDto workcalDto);
}
