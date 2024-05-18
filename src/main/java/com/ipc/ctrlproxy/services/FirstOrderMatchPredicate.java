package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Setter;

import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Predicate;

@Builder
public class FirstOrderMatchPredicate implements Predicate<Details> {

    private Details toMatch;

    @Setter(AccessLevel.PRIVATE)
    private final AtomicReference<Details> matched = new AtomicReference<>(null);

    public FirstOrderMatchPredicate(Details d) {
        this.toMatch = d;
    }
    @Override
    public boolean test(Details d) {
        if (matched.get() == null) {
            if (quantitiesNotNull(d, toMatch) && quantitiesMatch(d, toMatch) && hasEnoughSuspendedQty(d, toMatch)) {
                matched.set(d);
                return true;

            }
        }
        return false;
    }

    private boolean quantitiesNotNull(Details d1, Details toMatch)
    {
        return d1.getTransaction1Quantite() != null && toMatch.getTransaction2Quantite() != null && d1.getQuantiteSuspend() != null;
    }

    private boolean quantitiesMatch(Details d1, Details toMatch)
    {
        return Double.parseDouble(d1.getTransaction1Quantite()) == Double.parseDouble(toMatch.getTransaction2Quantite());
    }

    private boolean hasEnoughSuspendedQty(Details d1, Details toMatch) {
        double toReceive = Double.parseDouble(toMatch.getTransaction2Quantite());
        double left = Double.parseDouble(d1.getQuantiteSuspend());

        return toReceive <= left;
    }

    public Details getMatched() {
        return matched.get();
    }

}