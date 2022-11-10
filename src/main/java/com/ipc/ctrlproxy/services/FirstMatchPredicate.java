package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Predicate;

@Builder
public class FirstMatchPredicate implements Predicate<Details> {
    private
    Details toMatch;

    @Setter(AccessLevel.PRIVATE)
    private final AtomicReference<Details> matched = new AtomicReference<>(null);

    public FirstMatchPredicate(Details d) {
        this.toMatch = d;
    }
    @Override
    public boolean test(Details d) {
        if (matched == null) {
            if (d.getTransaction1Quantite() == toMatch.getTransaction1Quantite()) {
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