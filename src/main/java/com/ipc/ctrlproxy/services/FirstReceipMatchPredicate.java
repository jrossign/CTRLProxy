package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Setter;

import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Predicate;

@Builder
public class FirstReceipMatchPredicate implements Predicate<Details> {
    private
    Details toMatch;

    @Setter(AccessLevel.PRIVATE)
    private final AtomicReference<Details> matched = new AtomicReference<>(null);

    public FirstReceipMatchPredicate(Details d) {
        this.toMatch = d;
    }
    @Override
    public boolean test(Details d) {
        if (matched == null) {
            if (d.getTransaction1Quantite() == toMatch.getTransaction1Quantite() && d.getTransaction2Quantite() == toMatch.getTransaction2Quantite()) {
                matched.set(d);
                return true;
            }
        }
        return false;
    }

    public Details getMatched() {
        return matched.get();
    }

}