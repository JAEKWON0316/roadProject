package com.pk.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.pk.dto.RservationDto;

@Repository
public class reservationDao {
    
    private SqlSessionFactory sqlSessionFactory;

    public reservationDao(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public void saveReservation(RservationDto reservation) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            session.insert("com.pk.dao.reservationDao.insertReservation", reservation);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("예약 저장 중 오류 발생: " + e.getMessage());
        }
    }
}
