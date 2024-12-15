package com.pk.service;

import org.springframework.stereotype.Service;

import com.pk.dao.reservationDao;
import com.pk.dto.RservationDto;

@Service
public class ReservationService {
    
    private reservationDao reservationDao;

    public ReservationService(reservationDao reservationDao) {
        this.reservationDao = reservationDao;
    }

    public void saveReservation(RservationDto reservation) {
        reservationDao.saveReservation(reservation);
    }
}
