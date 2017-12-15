package com.dongyeop.okcomputer.dao_database;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dongyeop.okcomputer.dto.Zabbix;

public class ZabbixRowMapper implements RowMapper<Zabbix> {
	@Override
	public Zabbix mapRow(ResultSet rs, int rownum) throws SQLException {
		Zabbix zabbix = new Zabbix();
		zabbix.setHostid(rs.getString("hostid"));
		zabbix.setName(rs.getString("name"));
		zabbix.setHardware_full(rs.getString("hardware_full"));
		
		return zabbix;
	}
}
