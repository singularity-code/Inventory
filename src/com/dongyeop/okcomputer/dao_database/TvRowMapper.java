package com.dongyeop.okcomputer.dao_database;

import com.dongyeop.okcomputer.dto.Tv;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TvRowMapper implements RowMapper<Tv> {
    @Override
    public Tv mapRow(ResultSet rs, int rownum) throws SQLException {
        Tv tv = new Tv();
        tv.setId(rs.getString("id"));
        tv.setCampus(rs.getString("campus"));
        tv.setLocation(rs.getString("LOCATION"));
        tv.setType(rs.getString("type"));
        tv.setBrand(rs.getString("BRAND"));
        tv.setUser(rs.getString("user"));
        tv.setPrevious(rs.getString("previous"));

        return tv;
    }
}
